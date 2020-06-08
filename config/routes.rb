Rails.application.routes.draw do
  resources :dogs
  get '/about', to: 'static#about'
  root to: 'static#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
