class MembershipsController < ApplicationController

  def destroy
    @group = Group.find_by(id: params[:group])
    @membership = Membership.find_by(group_id: params[:group], user_id: params[:user] )
    @membership.destroy

    redirect_to @group
  end

end
