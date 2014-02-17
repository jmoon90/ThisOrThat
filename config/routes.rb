ThisOrThat::Application.routes.draw do
  devise_for :users
  root 'questions#show'
  resources :questions, shallow: true do
    resources :options
  end

  resources :options, shallow: true do
    resources :votes, only: [:create]
  end

  resources :statuses, only: [:index, :update, :destroy]
end
