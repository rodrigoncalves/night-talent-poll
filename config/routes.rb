Rails.application.routes.draw do
  root to: 'poll#index'
  resources :participants
  resources :teams
  resources :poll, only: [:index, :update]
  post 'poll', to: 'poll#update'
end
