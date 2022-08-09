Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecasts#index'
      get '/munchies', to: 'restaurants#show'
      post '/users', to: 'users#create'
      post '/sessions', to: 'users#show'
      post '/road_trip', to: 'road_trips#show'
    end
  end
end