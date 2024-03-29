Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles
  resources :users, except: [:new]

  root 'pages#index'

  get 'about', to: 'pages#about'
  get 'signup',  to: 'users#new'
  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  namespace :admin do
    resources :articles
    resources :users, except: [:new]
  end
end
