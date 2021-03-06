Rails.application.routes.draw do



  resources :photos
  scope "(:locale)", locale: /pl|en/ do

    # static pages

    get 'pages/:page', to: 'pages#static', as: 'static_page'
    get '/team' => 'pages#team', as: 'team'
    get '/press' => 'pages#press', as: 'press'
    # root route

    root 'pages#index'
    # root 'pages#team'
  end

  # browse resources
  # API

  resources :streets, only: [:index, :show]  do
    resources :places, only: [:index, :show]
  end




  # admin routes

  namespace :admin do
    root 'admin#index'
    resources :pages
    resources :streets do
      resources :places
    end

    # additional route for places resources, to prevent nesting photos
    resources :places do
      resources :photos
    end
  end

end
