class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
    	t.string :priority
    	t.string :task
    	t.date :due_date
    	t.integer :assigned_by
    	t.references :group_id
    	t.boolean :repeat 

      t.timestamps null: false
    end
  end
end
