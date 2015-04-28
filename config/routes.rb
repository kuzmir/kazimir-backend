Rails.application.routes.draw do



  scope "(:locale)", locale: /pl|en/ do

    # static pages

    get 'pages/:page', to: 'pages#static', as: 'static_page'

    # root route

    root 'pages#index'
  end

  # browse resources

  resources :streets



  # admin routes

  namespace :admin do
    root 'admin#index'
    resources :pages
    resources :streets do
      resources :places
    end
  end



end
