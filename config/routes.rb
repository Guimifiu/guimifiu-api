Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, except: [:new, :index, :edit, :show] do
      end
      post 'users/exists'   => 'users#provider_exists'
      post 'users/sign_in'  => 'users#sign_in'
      post 'users/create'   => 'users#create'
      post 'users/delete'   => 'users#delete'
      get  'users'          => 'users#search'
    end
  end
end
