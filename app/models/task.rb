class Task < ActiveRecord::Base

	belongs_to :group
	belongs_to :creator , {class_name: "User"}
	has_many :completions
	has_many :assigments


end
