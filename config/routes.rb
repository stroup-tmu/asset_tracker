Rails.application.routes.draw do
  resources :softwares
  resources :employees
  resources :devices
  resources :categories
  resources :manufacturers

  root "base#dashboard"
end
