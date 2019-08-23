Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # trying to come up with a good way to dynamically generate routes based on feature types from database, going full manual for now

  # trying to catch routing errors, but not working yet
  # match "*path", to: 'application#catch404', via: :all

  concern :api_base do
    resources :features
    get "/", to: "features#index"
    get "/random", to: "features#random"
    get "/campgrounds", to: "features#campgrounds"
    get "/lodges", to: "features#lodges"
    get '/fishing', to: 'features#fishing'
    get '/cave_entrances', to: 'features#cave_entrance'
    # get "/search/:query", to: "features#search"
    get '/ranger_stations', to: "features#ranger_stations"

    get '/type/*path', to: "features#type"
      # resources :features do
      #   Feature.generate_scopes
      #   Feature.scopes.each do |method|
      #     method = method.to_s.gsub("type_", "")
      #     get "#{method}", to: "features#{method}"
      # end
    # end

  end


  namespace :api do
    namespace :v1 do
      concerns :api_base
    end
  end

end
