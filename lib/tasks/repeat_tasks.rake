require 'rake'

task :create_repeat_task => :environment do
  tasks = Task.all

    tasks.each do |task|
	    puts "Checking if a repeated task needs to be created for #{task.task}."
	    
		 unless !task.due_date
		    if task.repeat == "weekly"
	    		new_task_due_date = task.due_date + 7.days
	    		new_task_repeat_date = Date.today + 7.days
	    	elsif task.repeat == "biweekly"
	    		new_task_due_date = task.due_date + 14.days
	    		new_task_repeat_date = Date.today + 14.days
	    	elsif task.repeat == "monthly"
	    		new_task_due_date = task.due_date + 30.days
	    		new_task_repeat_date = Date.today + 30.days
		    end
		end


	    if task.repeat != "" && task.repeat_date == Date.today
	    	args = { 
	    		priority: task.priority, 
	    		task: task.task, 
	    		due_date: new_task_due_date, 
	    		user_id: task.user_id, 
	    		group_id: task.group_id,
	    		repeat: task.repeat,
	    		repeat_date: new_task_repeat_date
	    		}
	    	puts "creating new task for #{task.task}"
	    	Task.create(args)
    
    	end
  end
end
