Rails.application.routes.draw do
  root to: 'poll#index'
  resources :participants
  resources :teams
  resources :poll, only: [:index, :update]
  post 'poll', to: 'poll#update'
  get 'resultado', to: 'poll#result'
  get 'codigos', to: 'poll#codes'
  post 'voting', to: 'poll#update_status'
end
