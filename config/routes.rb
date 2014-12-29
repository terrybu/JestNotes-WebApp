JestNotesWebApp::Application.routes.draw do
  resources :jokes
  root :to => "sessions#new"  

  get "login" => "sessions#new", :as => "login"  
  get "logout" => "sessions#destroy", :as => "logout"   
  get "sign_up" => "users#new", :as => "sign_up"  

  resources :users  
  resources :sessions 
  
end
