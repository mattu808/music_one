Rails.application.routes.draw do
  root 'artists#index'

  resources :songs
  resources :artists
  resources :rankings, only: [:index, :new, :create, :destroy]
  end
end
