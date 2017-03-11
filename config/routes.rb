Rails.application.routes.draw do
  resources :community_configs
  resources :recents
  devise_for :members
  resources :requests

  root 'community#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
