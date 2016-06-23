class Task < ActiveRecord::Base

	belongs_to :group

	belongs_to :user

	has_many :completions
	has_many :assignments


end
