GalleryJqueryFileUpload::Application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :presents

  match '/signin',  to: 'sessions#new' , via: :get
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/signup',  to: 'users#new'  , via: :get
  match '/dary',  to: 'presents#index'   , via: :get
  match '/snoubenci',  to: 'about_us#index'      , via: :get
  match '/snoubenci_galerie',  to: 'about_us#gallery'   , via: :get
  match '/zenich_galerie',  to: 'groom#gallery'  , via: :get
  match '/zenich',  to: 'groom#index'   , via: :get
  match '/nevesta',  to: 'bride#index'   , via: :get
 match '/nevesta_galerie',  to: 'bride#gallery'  , via: :get
  match '/home',    to: 'home#home'      , via: :get
  match '/aktuality',    to: 'home#aktuality'     , via: :get
  match '/dary',    to: 'home#dary'   , via: :get
  match '/program',    to: 'home#program'   , via: :get
  match '/kontakty',    to: 'home#kontakty'  , via: :get

  resources :galleries do
    resources :pictures do
      collection do
        post 'make_default'
      end
    end
  end
  resources :pictures

  root :to => 'home#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
