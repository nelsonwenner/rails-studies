Rails.application.routes.draw do
  resources :profiles
  resources :posts
  resources :comments
  resources :invitations
end
