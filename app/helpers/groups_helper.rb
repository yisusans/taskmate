module GroupsHelper

	def member?(user)
		!foo(user).empty?
	end

	def foo(user)
		@group.memberships.select do |p|
			p.user.email == user.email
		end
	end

end
