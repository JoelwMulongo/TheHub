Rails.application.routes.draw do
  resources :events, only: [:index, :show, :new, :create] do
    resources :signups, only: [:create]
  end

  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  root 'events#index'
end