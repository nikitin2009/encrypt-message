Rails.application.routes.draw do
  resources :messages, only: [:new, :show, :create]
end
