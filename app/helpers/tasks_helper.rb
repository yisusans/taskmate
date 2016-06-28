module TasksHelper

	def incomplete_tasks
		current_user.tasks.select do |task|
			task.completions.length == 0
		end
	end

	def assigned_tasks
		current_user.assigned_tasks.select do |task|
			task.completions.length == 0
		end
	end

end
