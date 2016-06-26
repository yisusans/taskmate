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
