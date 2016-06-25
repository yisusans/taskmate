module ApplicationHelper
	include GroupsHelper
	include MembershipsHelper
	include AssignmentsHelper
	include UsersHelper

	# module DateFormatting
	def long_form_date(timestamp)
	    timestamp.strftime('%B %e, %Y')
	end

	# def redirect_to_login
	# 	if current_user.id != params[:id]
	# 		flash[:errors] = ["You do not have access to this page."]
	# 		redirect_to '/users/sign_in'
	# 	end
	# end
end
