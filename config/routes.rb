Codemocracy::Application.routes.draw do |map|
  get 'projects' => 'projects#index', :as => :projects
  match 'projects/:action' => "projects"

  # User
  resources :users, :only => [:show, :edit, :update]
  # post    'add_rpx_auth'     => 'users#add_rpx_auth',   :as => :add_rpx_auth

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
  get     'register'    => 'registrations#new', :as => :register

  root    :to => 'projects#index'
end
