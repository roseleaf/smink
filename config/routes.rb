Smink::Application.routes.draw do
  resources :users, :links, :user_sessions
  root to: 'links#new'


  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout

  # get "sessions/name:string"

  # get "sessions/password:string"


   

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
