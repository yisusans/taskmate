class TasksController < ApplicationController
  include ApplicationHelper

  def new
    @task = Task.new
    @user = current_user
  end

  def edit
  end

  def create
    @group = Group.find_by(id: params[:task][:group_id])
    @task = Task.new(task_params)

    if @task.repeat == "weekly"
      @task.repeat_date = Date.today + 7.days
    elsif @task.repeat == "biweekly"
      @task.repeat_date = Date.today + 14.days
    elsif @task.repeat == "monthly"
      @task.repeat_date = Date.today + 30.days
    end

    if @task.save
      redirect_to @group
    else
      flash[:errors] = @task.errors.full_messages
      redirect_to @group
    end
  end


  def show
    @task = Task.find(params[:id])
    @assignment = Assignment.new
    @completion = Completion.new
  end

  def destroy
    set_task
    @group = Group.find_by(id: @task.group.id)
    @task.destroy
    redirect_to @group
  end

  private

    def set_task
      @task = Task.find_by(id: params[:id])
    end

    def task_params
      params.require(:task).permit(:priority, :task, :due_date, :user_id, :group_id, :repeat)
    end
end
