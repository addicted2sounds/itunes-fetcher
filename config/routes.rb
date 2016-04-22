Rails.application.routes.draw do
  resources :artists, only: [:index], defaults: { format: :json }
  resources :albums, only: [:index], defaults: { format: :json }
end
