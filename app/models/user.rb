class User < ActiveRecord::Base
	
	has_secure_password

	validates :password, :email, presence: true
	validates :email, uniqueness: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
	
	has_many :memberships
	has_many :groups, through: :memberships
	has_many :tasks, {foreign_key: :creator_id}
	has_many :assignments, {foreign_key: :assignee_id}
	has_many :assigned_tasks, through: :assignments
	has_many :completions, {foreign_key: :completer_id}
	has_many :completed_tasks, through: :completions
end
