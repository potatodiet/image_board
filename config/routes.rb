Rails.application.routes.draw do
  devise_for(:users)
  root("images#index")

  get("users/sign_up", to: "users#new", as: "sign_up")
  post("users/sign_up", to: "users#create")

  get("users/sign_in", to: "sessions#new", as: "sign_in")
  post("users/sign_in", to: "sessions#create")

  get("users/sign_out", to: "sessions#destroy", as: "sign_out")

  resources("users", only: [:show])
  resources("images", only: [:new, :create, :show, :edit, :update, :destroy])
  resources("comments", only: [:create, :destroy])

  get("search", to: "search#show", as: "search")
end
