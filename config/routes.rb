Codemocracy::Application.routes.draw do |map|
  # User
  resources :users, :except => [:index, :destroy]
  post    'add_rpx_auth'     => 'users#add_rpx_auth',   :as => :add_rpx_auth

  # UserSession
  get     'login'   => 'user_session#new',        :as => :login
  post    'login'   => 'user_session#create',     :as => :login
  delete  'logout'  => 'user_session#destroy',    :as => :logout

  # Request login
  get     'email_login'         => 'login_requests#new',     :as => :login_requests
  post    'email_login'         => 'login_requests#create',  :as => :login_requests
  put     'email_login/:id'     => 'login_requests#update',  :as => :login_request
  get     'email_login/:id'     => 'login_requests#show',    :as => :login_request

  # Info
  get     'program' => 'info#program',  :as => :program
  get     'about'   => 'info#about',    :as => :about

  # Registration
  resources :registrations, :except => [:index, :destroy]
  get     'register'                         => 'registrations#new',        :as => :register

  root    :to => 'registrations#new'
  
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
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
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
  #       get :recent, :on => :collection
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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
