Rails.application.routes.draw do
  devise_for :ad_users, path: 'ad_users' ,controllers: {
    sessions: 'ad_users/sessions',
    registrations: 'ad_users/registrations'
  }
  devise_for :st_users, path: 'st_users' ,controllers: {
    sessions: 'st_users/sessions',
    registrations: 'st_users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "top#index"
  resources :ad_users,　only: [:show, :edit, :update] do
    member do
      get :crossfollowing, :crossfollowers
     end
  end
  resources :st_users,　only: [:show, :edit, :update] do
    member do
     get :following, :followers, :crossfollowing, :crossfollowers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :crossfollows , only: [:create, :destroy]
  resources :speaks , except: :index
  resources :likes, only: [:create, :destroy]
  resources :comments , except: :index
end
