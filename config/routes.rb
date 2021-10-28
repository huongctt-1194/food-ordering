Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    devise_for :users
    root to: "foods#index"
    resources :categories
    resources :foods
    resources :order_addresses
    resources :order_items
    resources :orders

  end
end
