Rails.application.routes.draw do
  root to: 'tables#new'
  resources :tables
end
