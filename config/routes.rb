Rails.application.routes.draw do
  devise_for :users
  root "homepage#home"

  resources :articles, except: %i[destroy]
  resources :authors, except: %i[destroy]
  resources :showtimes, only: %i[index]
end
