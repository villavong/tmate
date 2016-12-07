Rails.application.routes.draw do
  devise_for :users
  root 'devise/sessions#new'
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
