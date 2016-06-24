class AssignmentsController < ApplicationController
  include ApplicationHelper

  private
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    def assignment_params
      params.fetch(:assignment, {})
    end
end
