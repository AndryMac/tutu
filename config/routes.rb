Rails.application.routes.draw do
  resources :trains
  resources :routes
  resources :carriages

  resources :railway_stations do
   patch :update_position_order, on: :member
   patch :update_time, on: :member
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

