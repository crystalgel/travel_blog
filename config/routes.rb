Rails.application.routes.draw do
 
  root "posts#index"
  resources :users
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy', as: :logout

  resources :posts do
      resources :comments
    end
end
