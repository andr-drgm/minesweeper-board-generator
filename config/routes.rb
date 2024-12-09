Rails.application.routes.draw do
  root "home#index"

  resources :tables, only: [ :create, :show, :index ]
end
