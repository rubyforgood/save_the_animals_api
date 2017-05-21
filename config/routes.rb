Rails.application.routes.draw do
  resources :ethograms
  devise_for :users

  get '/export/observations', controller: :observation_exports, action: :index

  namespace :api do
    resources :ethograms, only: :index
    resources :observation_sessions, only: :create
    post :auth, controller: :auth, action: :create
  end

  root to: 'home#index'
end
