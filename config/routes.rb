Rails.application.routes.draw do
  resources :ethograms

  # routes for devise users
  devise_for :users, :skip => [:registrations]
  devise_scope :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  get '/export/observations', controller: :observation_exports, action: :index

  namespace :api do
    resources :ethograms, only: :index
    resources :observation_sessions, only: :create
    post :auth, controller: :auth, action: :create
  end

  root to: 'home#index'
end
