Rails.application.routes.draw do
  devise_for :users
  root "homepage#home"
  get "about", to: "homepage#about"

  resources :articles, except: %i[destroy]
  resources :authors, except: %i[destroy]
  resources :showtimes, only: %i[index]
  resources :movies, only: %i[index show edit update]
  resources :movie_aliases, only: %i[create destroy]
  resources :movie_mergers, only: %i[update], on: :collection
  resources :theaters, only: %i[index show]
end
