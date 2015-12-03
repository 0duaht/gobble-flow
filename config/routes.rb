Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  get "/signup", to: "users#new", as: :signup
end
