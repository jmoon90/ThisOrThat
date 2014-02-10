ThisOrThat::Application.routes.draw do
  devise_for :users
  root 'choices#show'
  resources :choices, except: [:index]
  resources :statuses, only: [:index, :update, :destroy]
  resources :vote, only: [:update]
end
