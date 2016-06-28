class Task < ActiveRecord::Base

	belongs_to :group

	belongs_to :user

	has_many :completions
	has_many :assignments

	validates :priority, :task, :due_date, presence: true

	def to_s
		case self.priority
		when "3"
			self.priority = "high-priority"
		when "2"
			self.priority = "medium-priority"
		when "1"
			self.priority = "low-priority"
		end
	end

end
