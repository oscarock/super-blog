Rails.application.routes.draw do
  root "posts#index"		
  devise_for :users
  resources :posts do
  	resources :comments, only: [:create, :index, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
