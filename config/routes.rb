Web1::Application.routes.draw do
  resources :balances

  resources :companies

  resources :channels

  resources :products

  devise_for :users

  root :to => 'books#index'
  resources :books

  namespace :admin do
  	resources :companies, :clients, :agreements, :channels, :products, :balances, :imports
    match 'clear' => 'imports#clear'
     match 'checkafter' => 'imports#checkafter'
    match 'save' => 'imports#save'
    match 'checkdate' => 'imports#checkdate'
  end
 match '/admin', :to => 'admin/home#index', :as => :admin

end



