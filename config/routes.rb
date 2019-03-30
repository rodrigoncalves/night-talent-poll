Rails.application.routes.draw do
  root to: 'poll#index'
  resources :participants
  resources :teams
  resources :poll, only: [:index, :update]
  post 'poll', to: 'poll#update'
  get 'result', to: 'poll#result'
  get 'codes', to: 'poll#codes'
  post 'voting', to: 'poll#update_status'
end
