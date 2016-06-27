class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
    	t.string :priority, null: false
    	t.string :task, null: false
    	t.date :due_date, null: false
      t.references :user
    	t.references :group
    	t.string :repeat 
      t.date :repeat_date

      t.timestamps null: false
    end
  end
end
