Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/registration', to: 'users#new'
  post '/registration', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"

  get '/dashboard', to: 'dashboard#index'
  post '/friendships', to: 'friendships#create'

  get '/discover', to: 'dashboard#show'
  get '/top_40_rated_movies', to: 'movies#index'
  post '/movie', to: 'movies#index'
end
