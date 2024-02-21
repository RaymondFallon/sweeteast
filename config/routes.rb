Rails.application.routes.draw do
  devise_for :users
  root "articles#index"

  resources :articles, only: %i[index show new create]
  resources :authors, only: %i[index]
  resources :showtimes, only: %i[index]
end
