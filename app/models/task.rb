class Task < ActiveRecord::Base

	belongs_to :group
	belongs_to :creator , {class_name: "User", foreign_key: :creator_id}
	has_many :completions
	has_many :assigments


end
