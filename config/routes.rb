Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root 'books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   resources :books, only: [:index, :create, :show, :edit, :update, :destroy, :back] do
   end

   resources :users, only: [:show, :edit, :update]

end
