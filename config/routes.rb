Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/static_pages/home"
    get "/static_pages/help"
    get "/static_pages/contact"

    get "/categories/index"
    get "/categories/show"

    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"

    resources :products
    resources :users do
      resources :addresses
    end
    resources :categories do
      resources :products
    end
  end
end
