GalleryJqueryFileUpload::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :presents


  match '/signin',  to: 'sessions#new' , via: :get
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/signup',  to: 'users#new'  , via: :get
  match '/dary',  to: 'presents#index'   , via: :get
  match '/snoubenci',  to: 'about_us#index'      , via: :get
  match '/snoubenci_galerie',  to: 'galleries#index'   , via: :get
  match '/zenich_galerie',  to: 'groom_galleries#index'  , via: :get
  match '/zenich',  to: 'groom#index'   , via: :get
  match '/nevesta',  to: 'bride#index'   , via: :get
  match '/nevesta_galerie',  to: 'bride#gallery'  , via: :get
  match '/home',    to: 'home#home'      , via: :get
  match '/aktuality',    to: 'home#aktuality'     , via: :get
  match '/dary',    to: 'home#dary'   , via: :get
  match '/program',    to: 'home#program'   , via: :get
  match '/kontakty',    to: 'home#kontakty'  , via: :get

  post "gallery/create"
  resources :galleries do
    resources :pictures do
      collection do
        post 'make_default'
      end
    end
  end
  resources :pictures

  resources :groom_galleries do
    resources :groom_pictures do
      collection do
        post 'make_default'
      end
    end
  end
  resources :groom_pictures

  resources :bride_galleries do
    resources :bride_pictures do
      collection do
        post 'make_default'
      end
    end
  end
  resources :bride_pictures

  root :to => 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
