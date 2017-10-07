Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, except: [:new, :index, :edit, :show] do
        get 'fuel_supplies/history_months' => 'fuel_supplies#history_months'
        resources :fuel_supplies, except: [:new, :edit, :show, :update] do
        end
        resources :price_suggestions, except: [:new, :index, :edit, :show, :update] do
        end
      end

      # users
      post 'users/exists'   => 'users#provider_exists'
      post 'users/sign-in'  => 'users#sign_in'
      post 'users/create'   => 'users#create'
      post 'users/delete'   => 'users#delete'
      get  'users'          => 'users#search'

      # gas_stations
      get  'gas-stations' => 'gas_stations#get_all'

      # google_maps
      get 'get-place-location/:place_id'  =>  'google_maps#get_place_location'
      get 'get-gas-stations-on-direction' => 'google_maps#get_gas_stations_on_direction'
      get 'gas-stations/closest'          => 'google_maps#get_closest_gas_stations'


    end
  end
end
