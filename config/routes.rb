Rails.application.routes.draw do
get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
get '/login', to: 'sessions#new'
post 'longin', to:'sessions#create'
delete '/logout', to: 'sessions#destroy'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get '/destinations', to: 'destinations#index'       #'controllersname#action'
  get '/destinations/most_visited_country', to: 'destinations#most_visited_country'     #order matters, again because of dynamic routes (:id), place custom routes above dynamic routes
  # get '/destinations/:id', to: 'destinations#show', as: 'destination'  #to view only one destionation 
  # resources :destinations       #resources will build out the CRUD actions in one line vs having to dictate them individually
  
  resources :users        #best to avoided nested routes for users

  resources :pins, only: [:new, :create, :index]
  resources :destinations do
    resources :pins, shallow: true
  end

end
 