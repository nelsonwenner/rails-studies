Rails.application.routes.draw do
  resources :profiles
  resources :posts
  resources :comments
  
  resources :invitations do
    collection do
      post 'accept/:id', to: 'invitations#accept'
      delete 'reject/:id', to: 'invitations#reject'
    end
  end
  
  resources :friendships do
    collection do
      delete '/:profile_id/undo/:friend_id', to: 'friendships#undo'
    end
  end
end
