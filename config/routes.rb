Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers
  resources :destinations
  resources :posts

  get '/posts/:id/increase_likes', to: 'posts#increase_likes'
  post '/posts/:id/increase_likes', to: 'posts#increase_likes'

end