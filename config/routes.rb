Codemocracy::Application.routes.draw do
  post "users/create", :as => :users

  root :to => "welcome#index"
end
