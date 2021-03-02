Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :races, only: [:create]
      
      resources :tournaments, param: :year, only: [:index, :show] do
        resources :races, only: [:index]
      end
    end
  end
end
