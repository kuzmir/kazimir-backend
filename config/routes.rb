Rails.application.routes.draw do
  resources :streets

  # You can have the root of your site routed with "root"
  root 'pages#index'

  get 'pages/:page', to: 'pages#static', as: 'static_page'

  namespace :admin do
    root 'admin#index'
    resources :streets
  end



end
