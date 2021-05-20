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
  get '/discover', to: 'dashboard#show'

  post '/friendships', to: 'friendships#create'

  get '/top_40_rated_movies', to: 'movies#index'
  post '/movie', to: 'movies#index'
  get '/upcoming_movies', to: 'movies#upcoming_movies'
  get '/popular_movies', to: 'movies#popular_movies'

  get '/movie_details', to: 'movies#show'

  get 'new_viewing_party', to: 'viewing_party#new'
  post 'create_viewing_party', to: 'viewing_party#create'
end
