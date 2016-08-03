Rails.application.routes.draw do
  get 'votes/create'

  get 'questions/index'

  get 'questions/show'

  get 'polls/index'

  get 'polls/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#home'

  resources :poll do
    resources :quesitons
  end
  resources :votes, only: [:create]
end
