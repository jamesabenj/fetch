Rails.application.routes.draw do
  root to: 'sessions#home'
  resources :users do 
    resources :dogs
  end 

  get '/dogs', to: 'dogs#global_index', as: 'dogs'
  post '/dogs', to: 'dogs#create'
  post '/users/:user_id/dogs/:id/edit', to: 'dogs#update'
  get '/users/:id/profile', to: "users#profile", as: 'profile'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  post '/users/:user_id/dogs/:id/favorites', to: 'favorites#create', as: "create_favorite"
  get '/favorites', to: 'favorites#index', as: 'favs'
  get  '/popular', to: 'dogs#popular'

  get 'auth/:provider/callback', to: 'sessions#authcreate'
  get 'auth/failure', to: redirect('/')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
