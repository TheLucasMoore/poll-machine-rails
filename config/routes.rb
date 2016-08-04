Rails.application.routes.draw do
  devise_for :users, controllers: {:omniauth_callbacks => 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#home'

  resources :polls do
    resources :questions
    resources :charts, only: [:index]
  end
  resources :votes, only: [:create]
end
