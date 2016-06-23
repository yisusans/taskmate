class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|

    	t.references :task_id
    	t.integer :assignee

      t.timestamps null: false
    end
  end
end
