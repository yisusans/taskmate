class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|

    	t.references :task
    	t.integer :assignee_id
    	t.integer :assigner_id

      t.timestamps null: false
    end
  end
end
