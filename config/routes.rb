Rails.application.routes.draw do
  devise_for :users
  get 'home/index'

  namespace :api do
    post :auth, controller: :auth, action: :create
  end

  root to: 'home#index'
end
