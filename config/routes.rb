ThisOrThat::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks:
"users/omniauth_callbacks" }
  root 'questions#show'
  resources :questions, shallow: true do
    resources :options
  end

  resources :options, shallow: true do
    resources :votes, only: [:create]
  end

  resources :statuses, only: [:index, :update, :destroy]
end
