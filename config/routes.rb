Rails.application.routes.draw do
  
  root 'static_pages#home'

  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact'=> 'static_pages#contact'
  get 'cv' => 'static_pages#cv'
  get 'signup'=> 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users
  resources :microposts, only: [:create, :destroy]
end

