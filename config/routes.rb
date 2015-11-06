Rails.application.routes.draw do

  root "posts#map"
  resources :users
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy', as: :logout


  resources :posts do
      resources :comments
  end
  get 'map' => 'posts#map', as: :map_page
end
