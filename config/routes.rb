Rails.application.routes.draw do
  resources :trains do 
    resources :wagons, shallow: true
    resources :coupe_wagons,    controller: 'wagons', type: 'CoupeWagon',   shallow: true
    resources :economy_wagons,  controller: 'wagons', type: 'EconomyWagon', shallow: true
    resources :sv_wagons,       controller: 'wagons', type: 'SVWagon',      shallow: true
    resources :sitting_wagons,  controller: 'wagons', type: 'SittingWagon', shallow: true
  end
  resources :railway_stations do
    patch :update_position, on: :member 
    patch :update_time, on: :member
  end
  resources :routes
  # resources :wagons
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
