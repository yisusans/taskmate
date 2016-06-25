class AssignmentsController < ApplicationController
  include ApplicationHelper
  
  	def send_test_email
  		ModelMailer.test_email(@user).deliver
  	end

    def new
      @assignment = Assignment.new
    end

    def create
      @task = Task.find_by(id: params[:assignment][:task_id])
      @group = Group.find_by(id: @task.group_id)
      user = params[:assignment][:assignee_id]
      binding.pry
      assignee = @group.users.search_user
      @assignment = Assignment.new(task_id: params[:id], 
                                   assignee_id: assignee,
                                   assigner_id: current_user.id )
      puts "end"
    end

  private
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    def assignment_params
      params.require(:assignment).permit(:assignee_id)
    end
end
