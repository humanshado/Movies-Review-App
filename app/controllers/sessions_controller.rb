class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to (user)
    else
      flash.now[:notice] = "Invalid email/password combination"
      render :new
    end
  end

def destroy
  session[:user_id] = nil
  flash[:notice] = "Now you are signed out!"
  redirect_to root_url
end


end
