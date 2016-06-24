class AssignmentsController < ApplicationController
  include ApplicationHelper
  	def send_test_email
  		ModelMailer.test_email(@user).deliver
  	end

  private
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    def assignment_params
      params.fetch(:assignment, {})
    end
end
