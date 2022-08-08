Rails.application.routes.draw do
  resources :users
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecasts#index'
      get '/munchies', to: 'restaurants#show'
    end
  end
end