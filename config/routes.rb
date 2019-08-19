Rails.application.routes.draw do
  resources :messages, only: [:new, :show, :create]
  root "messages#new"
end
