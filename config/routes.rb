Codemocracy::Application.routes.draw do
  post "users/create"

  root :to => "welcome#index"
end
