Rails.application.routes.draw do
  root to: 'poll#index'
  resources :participants
  resources :teams
end
