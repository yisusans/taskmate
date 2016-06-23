class Group < ActiveRecord::Base
	belongs_to :membership
	has_many :tasks

end
