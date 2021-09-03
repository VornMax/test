Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :articles

  resources :comments
  
  root :to => "articles#index"

end
