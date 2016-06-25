class Invite < ActiveRecord::Base
	belongs_to :user

	belongs_to :invitee, {class_name: "User", foreign_key: :invitee_id}
	belongs_to :invitor, {class_name: "User", foreign_key: :inviter_id}



end
