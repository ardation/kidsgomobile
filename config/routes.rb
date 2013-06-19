Kgmapp::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do

  end

  authenticated :user do
    scope :module => :dashboard do
      root :to => "home#index"
      resources :devices do
        resources :messages
      end
    end
  end

  namespace :api do
    api_version(module: 'V1', header: {name: 'API-VERSION', value: 'v1'}, parameter: {name: "version", value: 'v1'}, path: {value: 'v1'}) do
      resources :messages
      resources :contacts
      resources :calls
      resources :apps
    end
  end

  root :to => "site#index", :defaults => { :format => "html" }

  match "terms" => "site#terms"
  resources :contact_forms
  match "about" => "site#about"
end
