Rails.application.routes.draw do

  namespace :settings do
    resources :tags
    resources :categories
  end

  get 'settings', action: 'index', controller: 'settings'

  resources :tag_associations

  resources :tasks
  root to: 'pages#home'
  devise_for :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
