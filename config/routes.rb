Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users, :controllers => {:registrations => "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :dashboards

  resources :cards, only: [:new, :create]

  resources :places, only: [:new, :create]

end
