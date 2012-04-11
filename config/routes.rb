Kbs::Application.routes.draw do
  devise_for :emps

  devise_for :users

  root :to => 'home#index'
  resources :balances

  namespace :admin do
  	resources :companies, :clients, :agreements, :channels, :products, :balances, :imports
    resources :users
    resources :emps
    match 'checkpro' => 'channels#checkpro'
    match 'clear' => 'imports#clear'
    match 'save' => 'imports#save'
    match 'checkdate' => 'imports#checkdate'
  end
  match '/admin', :to => 'admin/home#index', :as => :admin

end



