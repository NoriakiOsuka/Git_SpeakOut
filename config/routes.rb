Rails.application.routes.draw do
  devise_for :ad_users
  devise_for :st_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "top#index"
  resources :ad_users
  resources :st_users
end
