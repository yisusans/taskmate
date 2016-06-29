class InvitesController < ApplicationController
	include ApplicationHelper
	before_action :authenticate_user!

	def new
		@invite = Invite.new
	end

	def create
		@group = Group.find(params[:invite][:group])
		new_member = User.find_by(email: params[:invite][:invitee])


		if !new_member
			flash[:errors] = ["Sorry, this person is not a member of TaskMate."]
			redirect_to @group
		elsif member?(new_member)
			flash[:errors] = ["This person is already a member of your group."]
			redirect_to @group
		else
			@invite = Invite.new(inviter_id: current_user.id,
							 invitee_id: new_member.id,
							 group_id: @group.id)
			@invite.save
			redirect_to @group
		end			
	end

	def accept
		@group = Group.find(params[:group_id])
		@invite = Invite.find_by(group_id: @group.id,
								invitee_id: current_user.id)

		@user = User.find(current_user.id)
		if @invite
			@invite.destroy
			Membership.create(group_id: @group.id, user_id: current_user.id)
			redirect_to @group
		else
			flash[:errors] = ["Sorry, try again."]
			redirect_to @user
		end
	end
end
# check to see if this person is already a member