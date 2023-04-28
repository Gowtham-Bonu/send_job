Rails.application.routes.draw do
  root "events#index"
  devise_for :users
  resources :events, only: [:index] do
    member do
      get 'register'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
