ThisOrThat::Application.routes.draw do
  devise_for :users
  root 'choices#index'
  resources :choices

  resources :statuses, only: [:index, :update, :destroy]
end
