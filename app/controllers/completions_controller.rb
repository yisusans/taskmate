class CompletionsController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!

  def new
    @completion = Completion.new
  end

  def create
    if @completion = Completion.create!(completed: true, user_id:current_user.id, date_complete: Date.today, task_id: params[:task_id])
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