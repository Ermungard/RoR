class ArticlesController < ApplicationController
  before_action :find_article, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]


  def index
    @articles = Article.where(:visible => true).paginate(page: params[:page], :per_page => 5)
  end

  def draft
    @meta_title  = meta_title 'Мои статьи'
    @articles = Article.paginate(page: params[:page], :per_page => 5)
  end

  def show
    if @article.visible == true
      if @article.meta_title_articles.blank?
        @meta_title = meta_title @article.title
      else
         @meta_title = meta_title @article.meta_title_articles
      end
    else
      render :file => 'public/404.html', :status => :not_found, :layout => false
    end
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end
  # создание статьи
  def create
    @article = Article.new(article_params)
    @article.author_id = current_user.id

    if params[:draft]
      @article.visible = false
    end

    if @article.save && @article.visible == false
      redirect_to draft_path, notice: 'Статья была успешно добавлена в черновики'
    elsif @article.save && @article.visible == true
      redirect_to root_path, notice: 'Статья была успешно добавлена'
    else 
      render :new
    end
  end

  def update
    if params[:draft]
      @article.visible = false
    else
      @article.visible = true
    end
    if @article.update(article_params)
      redirect_to root_path, notice: 'Статья была успешно изменена'
    else
      render :edit
    end
  end

  def destroy
    if @article.present?
      @article.destroy
    end
     
    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :author, :all_tags, :visible, :author_id)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
