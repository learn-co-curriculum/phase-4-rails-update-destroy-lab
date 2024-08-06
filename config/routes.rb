Rails.application.routes.draw do
  resources :plants, only: [:index, :show, :create, :update, :destroy]
end
