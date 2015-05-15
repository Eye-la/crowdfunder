class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to root_url
    else
      render :new
    end
  end

  def update
    @user = current_user
    render '/users/_form.html.erb'
  end

  def show
    @user = current_user
    if @user.save
      flash[:notice] = "Profile updated!"
    else
      flash[:alert] = @user.errors.full_messages
    end
    redirect_to '/users/_form.html.erb'
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
