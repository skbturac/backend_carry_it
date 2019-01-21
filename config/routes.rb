Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      resources :users
      patch '/update', to: 'users#update'


      resources :users, only: [:create]

      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'



      resources :packages
      delete 'package/delete', to: 'packages#destroy'
      get '/user_packages', to: 'packages#user_packages'


      # resources :package, only: [:index, :create, :show, :update, :destroy] do
      #   post 'package', to: 'packages#add_package'
      #   delete 'package', to: 'packages#remove_package'
      # end

      resources :services
      get '/user_services', to: 'services#user_services'

      # resources :service, only: [:index, :create, :show, :update, :destroy] do
      #   post 'service', to: 'services#add_service'
      #   delete 'service', to: 'services#remove_service'
      # end

    end
  end
end


# fetch('http://localhost:3000/api/v1/users', {
#   method: 'POST',
#   headers: {
#     'Content-Type': 'application/json',
#     Accept: 'application/json'
#   },
#   body: JSON.stringify({
#     user: {
#       username: 'guy',
#       password: 'hi',
#       bio: 'King of Flavortown, USA',
#       avatar: 'https://upload.wikimedia.org/wikipedia/commons/9/9a/Guy_Fieri_at_Guantanamo_2.jpg'
#     }
#   })
# })
#   .then(r => r.json())
#   .then(console.log)
