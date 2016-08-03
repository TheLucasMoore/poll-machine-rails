Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#home'

  resources :polls do
    resources :quesitons
  end
  resources :votes, only: [:create]
end
