Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecasts#index'
      get '/munchies', to: 'restaurants#show'
      post '/users', to: 'users#create'
    end
  end
end