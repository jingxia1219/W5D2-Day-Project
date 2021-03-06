Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resource :session
  resources :subs do 
    resources :posts do
      resources :comments, only: [:new]
    end
  end 
  resources :comments, only: [:create]
end
