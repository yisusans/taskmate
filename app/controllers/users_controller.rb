class UsersController < ApplicationController
  include ApplicationHelper
  
  def show
    @user = User.find_by(id: params[:id])
  end
end
