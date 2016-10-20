Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  root 'spells#index'

  namespace :admin do
    resources :klasses, :path => :classes
    resources :specializations
    resources :users
  end

  resources :spells
  resources :characters
end
