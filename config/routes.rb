Rails.application.routes.draw do
  root "articles#index"

  resources :articles, only: %i[index show]
  resources :authors, only: %i[index]
  resources :showtimes, only: %i[index]
end
