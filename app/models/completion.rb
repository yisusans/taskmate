class Completion < ActiveRecord::Base
	has_many :completers, {class_name: "User", foreign_key: "completer_id"}
	belongs_to :tasks

end
