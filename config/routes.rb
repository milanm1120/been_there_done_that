Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get '/destinations', to: 'destinations#index'       #'controllersname#action'
  get '/destinations/most_visited_country', to: 'destinations#most_visited_country'     #order matters, again because of dynamic routes (:id), place custom routes above dynamic routes
  # get '/destinations/:id', to: 'destinations#show', as: 'destination'  #to view only one destionation 
  resources :destinations       #resources will build out the CRUD actions in one line vs having to dictate them individually
  resources :pins
end
