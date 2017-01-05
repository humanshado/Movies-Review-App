class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Account created successfully!"
      redirect_to users_path
    else
      render ('new')
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Account Updated Sucessfully!"
      redirect_to(@user)
    else
      render('edit')
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "User '#{@user.name}' deleted successfully!"
    redirect_to users_path
  end


private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
