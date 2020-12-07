Rails.application.routes.draw do
  resources :mining_types
  
  post 'coins', to: 'coins#create'
  get 'coins', to: 'coins#index'
  get 'coins/:id', to: 'coins#show'
  put 'coins/:id', to: 'coins#update'
  delete 'coins/:id', to: 'coins#destroy'
end
