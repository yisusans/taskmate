class Completion < ActiveRecord::Base

	belongs_to :user
	belongs_to :completer, class_name: "User"

	belongs_to :task
	
end
