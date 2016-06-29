class Group < ActiveRecord::Base
	has_many :memberships
	has_many :users, through: :memberships
	has_many :tasks
	has_many :invites

	has_one :conversation

	validates :name, presence: true

	def activity
		activity = self.creations + self.assignments + self.invitations + self.memberships
		activity.uniq!
		activity.sort_by{ |event| event.updated_at }.reverse
	end

	def creations
		self.tasks if self.tasks
	end

	def assignments
		assignments = []
		self.creations.each{|task| task.assignments.each{|a| assignments << a} if task.assignments}
		assignments
	end

	def completions
		completions = []
		self.creations.each{|task|task.completions.each{|c| completions << c} if task.completions}
		completions
	end

	def invitations
		self.invites if self.invites
	end
end
