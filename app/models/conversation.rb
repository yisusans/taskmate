class Conversation < ActiveRecord::Base
  belongs_to :group
  has_many :messages

  accepts_nested_attributes_for :messages
end
