Web1::Application.routes.draw do
  devise_for :users

  root :to => 'books#index'
  resources :balances

  namespace :admin do
  	resources :companies, :clients, :agreements, :channels, :products, :balances, :imports
    resources :users
    match 'checkpro' => 'channels#checkpro'
    match 'clear' => 'imports#clear'
    match 'save' => 'imports#save'
    match 'checkdate' => 'imports#checkdate'
  end
  match '/admin', :to => 'admin/home#index', :as => :admin

end



