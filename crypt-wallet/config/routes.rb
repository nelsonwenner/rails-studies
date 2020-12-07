Rails.application.routes.draw do
  post 'coins', to: 'coins#create'
  get 'coins', to: 'coins#index'
  get 'coins/:id', to: 'coins#show'
  put 'coins/:id', to: 'coins#update'
  delete 'coins/:id', to: 'coins#destroy'
end
