class Group < ActiveRecord::Base
	has_many :memberships
	has_many :users, through: :memberships
	has_many :tasks
	has_many :invites

end
