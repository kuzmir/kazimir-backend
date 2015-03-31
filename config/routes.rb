Rails.application.routes.draw do


  scope "(:locale)", locale: /pl|en/ do

    # browse resources

    resources :streets

    # static pages

    get 'pages/:page', to: 'pages#static', as: 'static_page'

    # root route

    root 'pages#index'
  end


  # admin routes

  namespace :admin do
    root 'admin#index'
    resources :pages
    resources :streets
  end



end
