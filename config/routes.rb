Rails.application.routes.draw do
  root to: 'spots#index'
  resources :spots, only: [:index, :create] do
    collection do
      get :user
    end
  end
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
