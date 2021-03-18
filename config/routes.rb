Rails.application.routes.draw do
  resources :events
  resources :attendances
  resources :users, only: [:new, :create, :show]

  get 'attendances/create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  post 'confirm_attendance',    to: 'attendances#create'

  root "events#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
