Rails.application.routes.draw do
  root to: 'spots#index'
  resources :spots, only: [:index, :create] do
    resources :votes, only: :create
    collection do
      get :user
      get '/hall-of-fame', to: 'spots#awesome', as: :awesome
    end
  end

  resources :hangouts, only: [:index, :create] do
    collection do
      post :user
    end
  end

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
