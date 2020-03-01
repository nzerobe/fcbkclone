Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'blogs#index'
  resources :blogs, only: [:new, :create, :edit, :destroy]
  
  resources :sessions,only:[:new,:create,:destroy]

  resources :users,only:[:new,:create,:show]
  
  resources :blogs do
    collection do
      post :confirm
    end
   end
  
  
end
