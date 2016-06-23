class Assignment < ActiveRecord::Base
	belongs_to :task
	belongs_to :user

	belongs_to :assignee, {class_name: "User", foreign_key: :assignee_id}
	belongs_to :assigner, {class_name: "User", foreign_key: :assigner_id}
end
