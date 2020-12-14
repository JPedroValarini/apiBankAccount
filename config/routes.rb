Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :users

      resources :accounts, only: [:create] do
        member do
          post :deposit
          post :withdraw
          post :transfer
        end
      end
    end
  end
end