Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#home'
  #static page
  get "help" => 'static_pages#help'
  get "about" => 'static_pages#about'
  get "contact" => 'static_pages#contact'
<<<<<<< HEAD
  #user
  get 'signup'  => 'users#new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :users

  namespace "admin" do
=======
  
  namespace :admin do
>>>>>>> admin
    root 'static_pages#home'
    resources :users
    resources :categories
  end

end
