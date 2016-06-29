class Invite < ActiveRecord::Base
	belongs_to :user

	belongs_to :invitee, {class_name: "User", foreign_key: :invitee_id}
	belongs_to :inviter, {class_name: "User", foreign_key: :inviter_id}

	belongs_to :group

	validates :inviter_id, :invitee_id, null: false

end
