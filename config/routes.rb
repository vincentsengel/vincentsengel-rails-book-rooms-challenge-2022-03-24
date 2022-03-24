
Rails.application.routes.draw do
  get 'bookings/create'
  get 'rooms/index'
  get 'rooms/show'
  devise_for :users
  root to: 'pages#home'
  resources :rooms, only: [ :index, :show ]
  resources :bookings, only: [ :create ]
end
