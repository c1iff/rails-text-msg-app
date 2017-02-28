Rails.application.routes.draw do
  root to: 'landing#index'
  resources :contacts
  resources :messages, :only => [:index, :new, :create, :show]
  devise_for :users
end
