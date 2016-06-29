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

	def user(event)
		case event.class.name
		when "Task"
			event.user
		when "Assignment"
			event.assigner
		when "Invite"
			event.inviter
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
			"joined the group."
		end
	end

	def direct_task(event)
		case event.class.name
			when "Task"
				event.task
			when "Completion"
				event.task.task
			when "Assignment"
				event.task.task
		end
	end

	def direct_user(event)
		event.invitee if event.class.name == "Invite"
	end

	def preposition(event)
		case event.class.name
		when "Assignment"
			"to"
		when "invited"
			"to the group."
		end
	end

	def indirect_user(event)
		event.assignee if event.class.name == "Assignment"
	end

end
