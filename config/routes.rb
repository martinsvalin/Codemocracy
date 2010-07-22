Codemocracy::Application.routes.draw do |map|
  # User
  # resources :users, :only => [:new, :edit, :create, :update]
  post    'users(.:format)'          => 'users#create',     :as => :users
  get     'users/new(.:format)'      => 'users#new',        :as => :new_user
  put     'users/:id(.:format)'      => 'users#update',     :as => :user
  get     'users/:id/edit(.:format)' => 'users#edit',       :as => :edit_user

  # UserSession
  get     'login(.:format)'   => 'user_session#new',        :as => :login
  post    'login(.:format)'   => 'user_session#create',     :as => :login
  delete  'logout(.:format)'  => 'user_session#destroy',    :as => :logout

  # Request login
  get     'email_login' => 'password_resets#new',     :as => :password_resets
  post    'email_login' => 'password_resets#create',  :as => :password_resets

  # Info
  get     'program' => 'info#program',  :as => :program
  get     'about'   => 'info#about',    :as => :about

  # Registration
  # resources :registrations, :only => [:new, :edit, :create, :update]
  post    'registrations(.:format)'          => 'registrations#create',     :as => :registrations
  get     'registrations/new(.:format)'      => 'registrations#new',        :as => :new_registration
  put     'registrations/:id(.:format)'      => 'registrations#update',     :as => :registration
  get     'registrations/:id/edit(.:format)' => 'registrations#edit',       :as => :edit_registration
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
