ThisOrThat::Application.routes.draw do
  devise_for :users
  resources :choices
end
