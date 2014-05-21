Rails.application.routes.draw do
  root 'welcome#index'

  get 'user/sign_up', to: 'users#new', as: 'sign_up'
  post 'user/sign_up', to: 'users#create'

  get 'user/sign_in', to: 'sessions#new', as: 'sign_in'
  post 'user/sign_in', to: 'sessions#create'

  get 'user/sign_out', to: 'sessions#destroy', as: 'sign_out'

  resources 'users', :only => [:show]
  resources 'images', :only => [:new, :create, :show, :edit, :update]
  resources 'comments', :only => [:create]

  get 'search', to: 'search#show', as: 'search'
end
