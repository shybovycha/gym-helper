Rails.application.routes.draw do
  get 'home/index'

  devise_for :users

  get '/' => 'users#show'
  get '/fetch_programs' => 'users#fetch_programs'
  post '/save_program' => 'users#save_program'

  resources :programs
  resources :excercises

  root 'home#index'
end
