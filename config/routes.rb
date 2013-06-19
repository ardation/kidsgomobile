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

  root :to => "site#index", :defaults => { :format => "html" }

  match "terms" => "site#terms"
  resources :contact_forms
  match "about" => "site#about"
end
