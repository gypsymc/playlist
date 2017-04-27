Rails.application.routes.draw do
	get 'songs/index'
	post '/create', to: 'songs#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  post '/login', to: 'users#login'
  get '/logout', to: 'users#logout'
  resources :songs
  resources :users
  resources :playlists
end
