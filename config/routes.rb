Rails.application.routes.draw do
  resources :return_modules
  resources :deliveries
  resources :inward_modules do
       collection do
      get :load_item_data
    end
  end

  resources :employees
  resources :products do
     collection do
      get :load_item_data
    end
  end
  resources :vendors do
    collection do
      get :load_vendor_data
    end
  end

  resources :vendor_reports do 
    collection do
      get :select_vendor
      get :view_vendor
    end
  end
  
  resources :companies
  devise_for :users
  as :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
end
  get 'home/index'
  root 'home#index'

  resources :home do
    collection do
      get :dashboard
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end