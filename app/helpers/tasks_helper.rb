module TasksHelper

	def incomplete_tasks
		current_user.tasks.select do |task|
			task.completions.length == 0
		end
	end

  	def high_priority
    	incomplete_tasks.select do |task|
    	  task.priority == "3"
    	end
  	end

  	def med_priority
    	incomplete_tasks.select do |task|
    	  task.priority == "2"
    	end
  	end

  	def low_priority
    	incomplete_tasks.select do |task|
    	  task.priority == "1"
    	end
  	end

	def assigned_tasks
		current_user.assigned_tasks.select do |task|
			task.completions.length == 0
		end
	end

end
