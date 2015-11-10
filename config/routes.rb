Rails.application.routes.draw do
  
  root 'static_pages#home'
  #static page
  get "help" => 'static_pages#help'
  get "about" => 'static_pages#about'
  get "contact" => 'static_pages#contact'

  #user
  get 'signup'  => 'users#new'

  get 'login'   => 'users#login'

  resources :users

  namespace "admin" do

    root 'static_pages#home'
    resources :categories
    resources :users
    resources :words
  end
  

end
