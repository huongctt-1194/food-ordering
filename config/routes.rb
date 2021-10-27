Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    devise_for :users
    root to: "foods#index"
    resources :categories
    resources :foods

  end
end
