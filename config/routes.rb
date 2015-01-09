JestNotesWebApp::Application.routes.draw do

  resources :jokes
  resources :setrecords
  
  root :to => "sessions#new"  

  get "login" => "sessions#new", :as => "login"  
  get "logout" => "sessions#destroy", :as => "logout"   
  get "sign_up" => "users#new", :as => "sign_up"  

  #static pages routes
  get 'about' => 'static#about', :as => :about

  resources :users  
  resources :sessions 
  
end
