Rails.application.routes.draw do

  resources :tags

  resources :tag_associations
  resources :categories
  resources :tasks
  root to: 'pages#home'
  devise_for :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
