Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  resources :bloggers
  resources :destinations

  patch 'posts/:id/like', to: 'posts#like', as: 'like_post'
end
