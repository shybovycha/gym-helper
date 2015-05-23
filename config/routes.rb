Rails.application.routes.draw do
  get 'home/index'

  devise_for :users

  resources :users do
    member do
      get 'fetch_programs'
    end
  end

  resources :programs
  resources :excercises

  root 'home#index'
end
