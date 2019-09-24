Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :destinations, only: [:index, :show]
  resources :bloggers, only: [:index, :show, :new, :create]
  resources :posts, only: [:index, :show, :create, :new, :edit, :update]
  post '/posts/:id/increment_likes', to: 'posts#increment_likes'
  
end
