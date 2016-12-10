Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root 'posts#index'
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Messages

   resources :conversations, only: [:index, :show, :destroy] do
     member do
       post :reply
     end
   end
   resources :conversations, only: [:index, :show, :destroy] do
     member do
       post :restore
     end
   end
   resources :conversations, only: [:index, :show, :destroy] do
       collection do
         delete :empty_trash
       end
     end

   resources :conversations, only: [:index, :show, :destroy] do
     member do
       post :mark_as_read
     end
   end
   resources :messages, only: [:new, :create]

end
