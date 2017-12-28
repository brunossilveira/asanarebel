Rails.application.routes.draw do
  defaults format: :json do
    resources :locations, only: [:index]
  end
end
