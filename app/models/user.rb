class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :confirmable

	has_many :memberships
	has_many :groups, through: :memberships

	has_many :tasks

	has_many :assignments

	has_many :assignments_given, foreign_key: :assigner_id, class_name: 'Assignment'
	has_many :delegated_tasks, through: :assignments_given, source: :task

	has_many :assignments_received, foreign_key: :assignee_id, class_name: 'Assignment'
	has_many :assigned_tasks, through: :assignments_received, source: :task

	has_many :completions
	has_many :completed_tasks, through: :completions, source: :task
end
