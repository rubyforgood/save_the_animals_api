Rails.application.routes.draw do
  namespace :api do
    post :auth, controller: :auth, action: :create
  end
end
