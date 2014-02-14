ThisOrThat::Application.routes.draw do
  devise_for :users
  root 'questions#show'
  resources :questions, shallow: true, except: [:index] do
    resources :options
  end

#  resources :options, only: [:create] do
#    resources :votes, only: [:create]
#  end

  resources :votes, only: [:create]
  resources :statuses, only: [:index, :update, :destroy]
end
