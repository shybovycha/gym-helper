Rails.application.routes.draw do
  get 'home/index'

  devise_for :users

  resources :users, only: [ :show ] do
    member do
      get 'fetch_programs'
    end
  end

  resources :programs
  resources :excercises

  root 'home#index'
end
