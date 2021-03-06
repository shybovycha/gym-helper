Rails.application.routes.draw do
  get 'home/index'

  devise_for :users

  get '/dashboard' => 'users#show', as: :user_dashboard
  get '/fetch_programs' => 'users#fetch_programs'
  post '/save_program' => 'users#save_program', as: :save_program
  get '/retrieve_auth_token' => 'users#retrieve_auth_token', as: :retrieve_auth_token

  resources :programs
  resources :excercises

  root to: 'home#index'
end
