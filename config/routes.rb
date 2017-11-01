Rails.application.routes.draw do
  root 'buildings#index'

  resources :buildings do
    resources :bathrooms
  end

  devise_for :users

end
