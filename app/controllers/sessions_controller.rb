class SessionsController < ApplicationController
  def new  
    if session[:user_id] != nil  
      redirect_to jokes_url  
    end
  end  
    
  def create  
    user = User.authenticate(params[:username], params[:password])  
    if user  
      session[:user_id] = user.id  
      redirect_to jokes_url, :notice => "Logged in!"  
    else  
      flash.now.alert = "Invalid username or password"  
      render "new"  
    end  
  end 

  def destroy  
  	session[:user_id] = nil  
  	redirect_to root_url, :notice => "Logged out!"  
	end 


end
