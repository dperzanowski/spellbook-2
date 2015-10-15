Rails.application.routes.draw do
  root 'spells#index'
  resources :spells
end
