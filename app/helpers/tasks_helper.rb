module TasksHelper

	def incomplete_tasks
		current_user.tasks.select do |task|
			task.completions.length == 0
		end
	end

end
