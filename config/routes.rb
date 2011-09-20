Codemocracy::Application.routes.draw do
  post "users/create", :as => :users

  # Legacy routes
  get "projects",                       :to => "projects2010#index"
  get "projects/valkoll",               :to => "projects2010#valkoll"
  get "projects/lokalpolitik",          :to => "projects2010#lokalpolitik"
  get "projects/myndighetskoll",        :to => "projects2010#myndighetskoll"
  get "projects/kollektivt",            :to => "projects2010#kollektivt"
  get "projects/riksdagen_pa_facebook", :to => "projects2010#riksdagen_pa_facebook"
  get "projects/engagemangsindex",      :to => "projects2010#engagemangsindex"
  get "projects/boreda_at_codemocracy", :to => "projects2010#boreda_at_codemocracy"
  get "projects/crime_tracker",         :to => "projects2010#crime_tracker"
  get "projects/tagtider",              :to => "projects2010#tagtider"
  get "projects/riksdagen_i_ply",       :to => "projects2010#riksdagen_i_ply"
  get "projects/georapport",            :to => "projects2010#georapport"
  get "projects/edemokrat",             :to => "projects2010#edemokrat"

  root :to => "welcome#index"
end
