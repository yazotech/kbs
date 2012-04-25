Kbs::Application.routes.draw do
  devise_for :emps

  devise_for :users

  root :to => 'home#index'
  resources :balances do
    collection do
      get :login, :q, :month_list
    end
  end

  namespace :admin do
  	resources :companies, :clients, :agreements, :channels, :products, :balances, :imports
    resources :user_infos, :users
    resources :emps
    match 'seachuser' => 'users#seachuser'
    match 'checkpro' => 'channels#checkpro'
    match 'clear' => 'imports#clear'
    match 'save' => 'imports#save'
    match 'checkdate' => 'imports#checkdate'
    match 'sjflot' => 'imports#sjfloat'
  end
  match '/admin', :to => 'admin/home#index', :as => :admin

end



