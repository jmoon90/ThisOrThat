ThisOrThat::Application.routes.draw do
  devise_for :users
  root 'choices#index'
  resources :choices
end
