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
  	resources :companies, :clients, :agreements, :channels, :products, :balances
    resources :user_infos, :users
    resources :emps
    resources :imports do
      collection do
        get :check_data, :save_data, :clear_data, :import_data
      end
    end
    match 'seachuser' => 'users#seachuser'
    match 'checkpro' => 'channels#checkpro'
  end
  match '/admin', :to => 'admin/home#index', :as => :admin

end



