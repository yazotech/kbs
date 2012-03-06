Web1::Application.routes.draw do
  devise_for :users

  root :to => 'books#index'
  resources :books

  namespace :admin do
  	resources :companies, :channels, :products, :balances
  end

  match '/admin', :to => 'admin/home#index', :as => :admin

end
