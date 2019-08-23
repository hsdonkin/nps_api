Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  concern :api_base do
    resources :features
    get "/", to: "features#index"
    get "/random", to: "features#random"
    get "/campsites", to: "features#campsites"
  end


  namespace :api do
    namespace :v1 do
      concerns :api_base
    end
  end

end
