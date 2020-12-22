Rails.application.routes.draw do
  resources :profiles
  resources :posts
  resources :comments
  
  resources :invitations do
    collection do
      delete 'reject/:id', to: 'invitations#reject'
    end
  end
end
