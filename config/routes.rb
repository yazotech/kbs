Web1::Application.routes.draw do
  resources :balances

  resources :companies

  resources :channels

  resources :products

  devise_for :users

  root :to => 'books#index'
  resources :books

  namespace :admin do
  	resources :companies, :channels, :products, :balances, :imports
    match 'clear' => 'imports#clear'
    match 'save' => 'imports#save'
  end
 match '/admin', :to => 'admin/home#index', :as => :admin

end



