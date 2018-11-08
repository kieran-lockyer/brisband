Rails.application.routes.draw do
  resources :comments
  resources :bands, :comments, :items, :charges, :messages
  
  resources :conversations do
    resources :messages

    collection do
      get :inbox
      get :all, action: :index
      get :sent
      get :trash
    end
  end

  resources :bands, :items do
    member do
      delete :delete_image_attachment
    end
  end

  resources :comments, :items do
    member do
      post :flag
      post :unflag
    end
  end
  
  get 'home/admin', to: 'home#admin', as: 'admin'
  get 'user/:id', to: 'user#show', as: 'user'
  devise_for :users
  get 'home/guidelines'
  get "home/legal"
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
end
