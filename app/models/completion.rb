class Completion < ActiveRecord::Base

	belongs_to :user
	belongs_to :completer, class_name: "User", foreign_key: :user_id

	belongs_to :task

	validates :completed, :user, :date_complete, presence: true
end
