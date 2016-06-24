# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

susan = User.create!(email: "ssyssy@susan.com",
					 password: "000000")
joe = User.create!(email: "joe_joe@joe.com",
				   password: "000000")

group = Group.create!(name: "291 Crown Street APT 1")

membership = Membership.create!(user_id: 1,
							    group_id: 1)


task = Task.create!(priority: "important",
					task: "mop the floor",
					group_id: 1,
					repeat: false,
					user_id: 1)

assignment = Assignment.create!(task_id: 1, assignee_id: 2, assigner_id: 1)

complete = Completion.create!(completed: false,
							  user_id: 2,
							  task_id: 1)
