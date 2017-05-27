Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, except: [:new, :index, :edit, :show] do
      end

      #users
      post 'users/exists'   => 'users#provider_exists'
      post 'users/sign-in'  => 'users#sign_in'
      post 'users/create'   => 'users#create'
      post 'users/delete'   => 'users#delete'
      get  'users'          => 'users#search'

      #gas_stations
      get  'gas-stations'  => 'gas_stations#get_all'

      #google_maps
      get 'get-place-location/:place_id' =>  'google_maps#get_place_location'

    end
  end
end
