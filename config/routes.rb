Rails.application.routes.draw do

  namespace :settings do
    resources :tags
    resources :categories
  end

  get 'settings', action: 'index', controller: 'settings'
  get 'account', action: 'index', controller: 'account'




  resources :tasks do
    collection do
      get 'completed'
      get 'pending'
      get 'by-category/:category_id/(by-tags/*tags)', to: 'tasks#filtered'
      delete 'delete'
    end
  end



  resources :tag_associations

  resources :tasks
  root to: 'pages#home'
  devise_for :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
