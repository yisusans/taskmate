class UsersController < ApplicationController
  include ApplicationHelper
  
  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
    @email = @user.email
  end

  def create
    @user = User.new(user_params)
    if @user.save
      
      # Sends email to user when user is created.
      ModelMailer.test_email(@user).deliver

      log_in(@user)
      redirect_to @user
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end


private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
  
end
