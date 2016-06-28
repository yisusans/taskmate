class CompletionsController < ApplicationController
  include ApplicationHelper

  def new
    @completion = Completion.new
  end

  def create
    @task = Task.find(params[:completion][:task_id])
    @completion = Completion.new(completed: true,
                                 user_id: current_user.id,
                                 date_complete: Date.today,
                                 task_id: @task.id
                                 )
    if @completion.save
      redirect_to @task
    else
      flash[:errors] = @completion.errors.full_messages
      redirect_to @task
    end
  end



  private
  
    def set_completion
      @completion = Completion.find(params[:id])
    end

    def completion_params
      params.require(:completion).permit(:assignee_id)
    end
end