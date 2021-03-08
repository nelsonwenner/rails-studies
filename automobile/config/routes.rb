Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :races, only: [:create]
      
      resources :tournaments, param: :year, only: [:index, :show] do
        resources :races, only: [:index] do
          collection do
            get "/:month/:day/classifications", 
            to: "classifications#index", 
            as: "classification"
          end
        end
      end
    end
  end
end
