Rails.application.routes.draw do
  resources :softwares
  resources :employees
  resources :devices
  resources :categories
  resources :manufacturers

  get 'search', to: "search#index"

  root "base#dashboard"
end
