Rails.application.routes.draw do
  root 'spells#index'
  resources :spells

  namespace :admin do
    resources :klasses, :path => :classes
    resources :specializations
  end
end
