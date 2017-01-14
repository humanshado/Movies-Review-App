class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update, :destroy]

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
    @favorites = @user.favorite_movies
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      if current_user_admin?
        flash[:notice] = "Account created successfully!"
        redirect_to users_path
      else
        session[:user_id] = @user.id
        flash[:notice] = "Account created successfully!"
        redirect_to user_path(@user)
      end
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
    redirect_to(root_url)
  end


private

  def require_correct_user
    @user = User.find(params[:id])
    unless current_user?(@user) || current_user_admin?
      flash[:notice] = "Not Correct user, Access Denied!"
      redirect_to(root_url)
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
