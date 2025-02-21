Rails.application.routes.draw do
  get 'vege', to: "vege_prices#show"
  resources :gemini, only: %i(new create)

  get 'weather', to: 'weather#show'

  resources :users
  
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  resources :articles do
    resources :comments, only: %i(create destroy)
  end
  
  root to: 'articles#index'

end
