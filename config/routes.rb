Rails.application.routes.draw do
  get 'users/index' => 'users#index'
  get 'users/home' => 'users#home'
  get 'users/login' => 'users#login'
  delete 'users/home' => 'users#logout'
  post 'users/login' => 'users#check'
end
