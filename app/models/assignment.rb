class Assignment < ActiveRecord::Base
	belongs_to :task
	belongs_to :assignee, {class_name: "User", foreign_key: :assignee_id}
end
