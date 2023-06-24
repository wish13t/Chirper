Rails.application.routes.draw do
  get 'sessions/new'
  root             'public_pages#home'
  get 'help'    => 'public_pages#help'
  get 'about'   => 'public_pages#about'
  get 'contact' => 'public_pages#contact'
  get 'signup'  => 'users#new'
  get 'login'   => 'sessions#new'
  post 'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :blogs
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "users#index"
end
