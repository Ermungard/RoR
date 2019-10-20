Rails.application.routes.draw do
  devise_for :users

  # ресурсное объявление экшенов для контроллера comments
  resources :articles do
  	resources :comments
  end
  resources :tags, only: [:show]
  resources :articles, only: [:show, :index]

  # редиректы и пути страниц сайта
  get '/draft' => 'articles#draft'
  root 'articles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
