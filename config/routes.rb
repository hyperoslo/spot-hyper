Rails.application.routes.draw do
  root to: 'spots#index'
  resources :spots, only: [:index, :create] do
    resources :votes, only: :create
    collection do
      get :user
      get :awesome
    end
  end
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
