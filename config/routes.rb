Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  concern :commentable do |options|
    resources :comments, options
  end

  resources :articles do
    concerns :commentable, commentable_type: 'Article'
  end

  resources :comments do
    concerns :commentable, commentable_type: 'Comment'
  end


  resources :tags
  root 'welcome#index'
end
