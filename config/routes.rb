Rails.application.routes.draw do
  devise_for :users

  resources :tickets
  resource :search, only: [:show, :create]

  namespace :admin do
    resources :railway_stations do
      patch :update_position_order, on: :member
      patch :update_time, on: :member
    end

    resources :trains do
      resources :carriages, shallow: true
    end

    resources :routes
    resources :tickets
  end

  root 'searches#show'
  get  'searches/index'
  get 'start/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

