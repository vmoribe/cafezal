Rails.application.routes.draw do
  
  get 'lotes/consolidado'
  resources :lotes
  
  resources :produtos

  resources :vargessos

  resources :variavels

  resources :parametros

    get 'analises/relacoes'
    get 'analises/fertilizantes'
    get 'analises/micronutrientes'
    get 'analises/gessagem'
    get 'analises/calagem'
    get 'analises/fertilidade'
    get 'analises/historico'
  
  resources :analises

  resources :talhaos

  resources :fazendas

  namespace :admin do
    resources :users
    root to: "users#index"
  end
  
  root to: 'visitors#index'
  devise_for :users
end
