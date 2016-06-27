class AssignmentsController < ApplicationController
  include ApplicationHelper

    def new
      @assignment = Assignment.new
    end

    def create
      @task = Task.find_by(id: params[:assignment][:task_id])
      @group = Group.find_by(id: @task.group_id)
      user = params[:assignment][:assignee_id].to_i
      assignee = @group.users.find(user)
      @assignment = Assignment.new(task_id: @task.id, 
                                   assignee_id: assignee.id,
                                   assigner_id: current_user.id )
      if @assignment.save
        redirect_to @task
      else
        flash[:errors] = @assignment.errors.full_messages
        redirect_to @task
      end

    end

  private
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    def assignment_params
      params.require(:assignment).permit(:assignee_id)
    end
end
