Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  root to: 'investments#index'
  devise_for :users
  resources :users

  get '/login_as_investor', to: 'investments#login_as_investor'
end
