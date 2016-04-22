Rails.application.routes.draw do
  resources :artists, only: [:index], defaults: { format: :json }
end
