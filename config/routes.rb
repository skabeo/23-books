Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
  resources :categories, only: [:index, :show, :new, :create, :destroy, :update] do
    resources :tranactions, only: [:index, :new, :create, :destroy, :edit, :update]
  end
end
