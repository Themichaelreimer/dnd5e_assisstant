Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :products
  resources :users

  root to: 'products#index'

  #devise_scope :user do
  #   delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  #end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
