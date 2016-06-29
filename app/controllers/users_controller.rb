class UsersController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!
  
  def show
  	@invite = Invite.new
    @user = User.find_by(id: current_user.id)
    @groups = @user.groups
    @tasks = @user.tasks.order('created_at ASC')
    @completed_tasks = @user.completed_tasks.order('date_complete DESC')
  end


end
