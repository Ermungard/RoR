class CommentsController < ApplicationController
	before_action :authenticate_user!
	# создание коментария
	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params)
		redirect_to article_path(@article)
	end
	# удаление коментария
	def destroy 
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	private
		# получение параметров коментария
	    def comment_params
	    	params.require(:comment).permit(:body, :user_id).merge({user_id: current_user.id})
	    end
end
