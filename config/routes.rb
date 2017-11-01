Rails.application.routes.draw do
  root 'buildings#index'

  resources :buildings

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
