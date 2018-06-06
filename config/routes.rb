Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  #resources :templates
  #resources :actors
  root to: 'sessions#new'
  #root to: 'templates#index'

  get '/signup' => 'users#new'
  get '/logout' => 'sessions#destroy'
  get '/login' => 'sessions#new'
  post '/users' => 'users#create'

end
