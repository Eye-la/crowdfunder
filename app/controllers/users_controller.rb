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

  def edit
    @user = current_user
    render '/users/_form.html.erb'
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to edit_user_url, notice: "Profile updated!"
    else
      redirect_to edit_user_url, alert: @user.errors.full_messages
    end
  end

  def show
    @user = current_user
    render '/users/_form.html.erb'
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
