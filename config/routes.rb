Kbs::Application.routes.draw do
  devise_for :emps

  root :to => 'home#index'
  resources :balances do
    collection do
      get :login, :q, :month_list, :ch
    end
  end

  namespace :admin do
  	resources :companies, :agreements, :channels, :products, :balances
    resources :clients do
      member do
        get :add_user
      end
    end
    resources :user_infos, :users
    resources :emps
    resources :imports do
      collection do
        get :check_data, :save_data, :clear_data, :import_data
      end
    end
    match 'checkpro' => 'channels#checkpro'

    match 'sjflot' => 'imports#sjfloat'

    match 'data_tools(/:action)' => 'data_tools'
    match 'reports(/:action)' => 'reports'
    match 'diagrams(/:action)' => 'diagrams'
  end
  match '/admin', :to => 'admin/home#index', :as => :admin

end



