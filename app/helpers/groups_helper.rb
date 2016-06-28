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

	def subject(event)
		case event.class.name
		when "Task"
			event.user
		when "Assignment"
			event.assigner
		when "Invite"
			event.invitor
		when "Completion"
			event.completer
		when "Membership"
			event.user
		end
	end

	def verb(event)
		case event.class.name
		when "Task"
			"created"
		when "Assignment"
			"assigned"
		when "Invite"
			"invited"
		when "Completion"
			"completed"
		when "Membership"
			"joined"
		end
	end

	def direct_obj(event)
		case event.class.name
			when "Task"
				event.task
			when "Completion"
				event.task.task
			when "Membership"
				event.group.name
			when "Assignment"
				event.task.task
			when "Invite"
				event.invitee.name
		end
	end

	def preposition(event)
		case event.class.name
		when "Assignment"
			"to"
		when "invited"
			"to"
		end
	end

	def indirect_obj(event)
		case event.class.name
		when "Assignment"
			event.assignee.name
		when "Invite"
			event.name
		end
	end

end
