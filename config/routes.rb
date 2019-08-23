Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # trying to come up with a good way to dynamically generate routes based on feature types from database, going full manual for now

  concern :api_base do
    resources :features
    get "/", to: "features#index"
    get "/random", to: "features#random"
    get "/campgrounds", to: "features#campgrounds"
    get "/lodges", to: "features#lodges"
    get '/fishing', to: 'features#fishing'
    get '/cave_entrance', to: 'features#cave_entrance'
    # get "/search/:query", to: "features#search"
    get '/ranger_stations', to: "features#ranger_stations"
  end


  namespace :api do
    namespace :v1 do
      concerns :api_base
    end
  end

end
