class InvitesController < ApplicationController
	include ApplicationHelper

	def new
		@invite = Invite.new
	end

	def create
		@group = Group.find(params[:invite][:group])
		new_member = User.find_by(email: params[:invite][:invitee])


		if !new_member
			flash[:errors] = ["Sorry, this person is not a member."]
			redirect_to @group
		elsif member?(new_member)
			flash[:errors] = ["This person is already a member of your group."]
			redirect_to @group
		else
			@invite = Invite.new(inviter_id: current_user.id,
							 invitee_id: new_member.id)
			@invite.save
			redirect_to @group
		end			

	end
end
# check to see if this person is already a member