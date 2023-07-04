Rails.application.routes.draw do
  resources :images
  get 'sessions/new'
  root             'public_pages#home'
  get 'help'    => 'public_pages#help'
  get 'about'   => 'public_pages#about'
  get 'contact' => 'public_pages#contact'
  get 'signup'  => 'users#new'
  get 'login'   => 'sessions#new'
  post 'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  post 'blogs/create'

  resources :users
  resources :blogs, only: [:create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "users#index"
end
