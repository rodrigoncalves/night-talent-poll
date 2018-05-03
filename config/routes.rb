Rails.application.routes.draw do
  resources :participants
  root to: 'teams#index'
  resources :teams
end
