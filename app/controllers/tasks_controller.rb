class TasksController < ApplicationController
  include ApplicationHelper

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @group = Group.find_by(id: params[:task][:group_id])
    @task = Task.new(task_params)
    if @task.save
      redirect_to @group
    else
      flash[:errors] = @task.errors.full_messages
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
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
      params.require(:task).permit(:priority, :task, :due_date, :user_id, :group_id, :repeats)
    end
end
