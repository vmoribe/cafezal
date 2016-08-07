Rails.application.routes.draw do
  resources :fazendas

  namespace :admin do
    resources :users
    root to: "users#index"
  end
  root to: 'visitors#index'
  devise_for :users
end
