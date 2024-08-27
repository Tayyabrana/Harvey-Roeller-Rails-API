Rails.application.routes.draw do
  # Root route
  root to: 'home#index' # Or another controller/action as your root

  # Devise routes for User authentication
  devise_for :users, controllers: {
    registrations: 'api/v1/registrations',
    sessions: 'api/v1/sessions'
  }

  # Custom API routes
  namespace :api do
    namespace :v1 do
      post 'signup', to: 'registrations#create'
      post 'login', to: 'sessions#create'
    end
  end

  # You can add other routes here
end
