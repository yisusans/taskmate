module ApplicationHelper
	include GroupsHelper
	include MembershipsHelper
	include AssignmentsHelper
	include UsersHelper
	include TasksHelper

	# module DateFormatting
	def long_form_date(timestamp)
	    timestamp.strftime('%B %e, %Y')
	end

end
