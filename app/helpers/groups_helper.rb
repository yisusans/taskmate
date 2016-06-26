module GroupsHelper

	def member?(user)
		!find_by_email(user).empty?
	end

	def find_by_email(user)
		@group.memberships.select do |p|
			p.user.email == user.email
		end
	end

	def redirect_to_user
		redirect_to current_user unless member?(current_user)
	end

end
