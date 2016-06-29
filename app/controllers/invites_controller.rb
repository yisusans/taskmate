class InvitesController < ApplicationController
	include ApplicationHelper
	before_action :authenticate_user!

	def new
		@invite = Invite.new
	end

	def create
		@group = Group.find(params[:invite][:group_id])
		new_member = User.search_user(params[:invite][:invitee])

		if new_member.empty?
			render :json => "No user by that name.", :status => 404
		elsif member?(new_member.first)
			render :json => "This person is already a member.", :status => 406
		else
			@invite = Invite.new(inviter_id: current_user.id,
							 invitee_id: new_member.first.id,
							 group_id: @group.id)
			@invite.save
			render :json => "Invite more!", :status => 200
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