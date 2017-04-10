Rails.application.routes.draw do
  root 'queries#index'
  resources :queries, only: [:index, :create, :new] do
    collection do
      post :find_or_create
      get :search
    end
  end
end
