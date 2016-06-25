class UsersController < ApplicationController
  include ApplicationHelper
  
  def show
    @user = User.find_by(id: params[:id])
    @groups = @user.groups
    @tasks = @user.tasks.order('created_at ASC')
    @completed_tasks = @user.completed_tasks.order('date_complete DESC')
  end


end
