class CompletionsController < ApplicationController
  include ApplicationHelper

  def new
    @completion = Completion.new
  end

  def edit
  end

  def create
    @completion = Completion.new(completion_params)
  end

  def update
    respond_to do |format|
      if @completion.update(completion_params)
        format.html { redirect_to @completion, notice: 'Completion was successfully updated.' }
        format.json { render :show, status: :ok, location: @completion }
      else
        format.html { render :edit }
        format.json { render json: @completion.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  
    def set_completion
      @completion = Completion.find(params[:id])
    end

    def completion_params
      params.fetch(:completion, {})
    end
end
