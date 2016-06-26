class GroupsController < ApplicationController
  include ApplicationHelper
  
  def show
    @group = Group.find_by(id: params[:id])
    @members = @group.users
    @task = Task.new
    @membership = Membership.new
    @invite = Invite.new
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      @membership = Membership.create(group_id: @group.id,
                                      user_id: current_user.id)
      redirect_to @group
    else
      flash[:errors] = @group.errors.full_messages
      redirect_to '/groups/new'
    end

  end

  def destroy
    @group.destroy
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name)
    end
end
