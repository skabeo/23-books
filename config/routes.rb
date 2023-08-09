Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  authenticated :user do
    root to: "categories#index", as: :authenticated_root
  end
  root "home#index"
  resources :categories, only: [:index, :show, :new, :create, :destroy, :update] do
    resources :details, only: [:index, :new, :create, :destroy, :edit, :update]
  end
end
