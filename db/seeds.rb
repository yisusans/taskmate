# Regular Roommates
greene_house = Group.create!(name: "Greene House")
ena = User.create!(name: "Ena", email: "ena@taskmate.com", password: "123456", unconfirmed_email: nil)
greg = User.create!(name:"Greg", email:"greg@gmail.com", password: "123456", unconfirmed_email: nil)
ena.memberships.create!(group_id: greene_house.id)

Task.create!(task: "Take out the trash!", group_id: greene_house.id, user_id: 1, priority: "!!!")
ena.assignments_given.create!(task_id: 1, assignee_id: greg.id)
Task.create!(task: "Mop the floor.", group_id: greene_house.id, user_id: 2, priority: "!!")

greg.assignments_given.create!(task_id: 2, assignee_id: ena.id)
greg.completions.create!(completed: true, task_id: 1)

Conversation.create!(group_id: 1)
greg.messages_sent.create!(content: "The floor is a mess!", conversation_id: 1, receiver_id: 1)
ena.messages_sent.create!(content: "ill fuck your shit up Greg.", conversation_id: 1, receiver_id: 2)

# Bonnaroo Trip
bonnaroo = Group.create!(name: "Bonnaroo 2013")

# Susan's old co-op
coop = Group.create!(name: "Coin Court & Casino Co-op")

# Dev Bootcamp
dbc = Group.create!(name: "Dev Bootcamp")

# Family
family = Group.create!(name: "The Hankerson Household")
