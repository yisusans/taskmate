class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
    	t.string :priority
    	t.string :task
    	t.date :due_date
      t.references :user
    	t.references :group
    	t.string :repeat 
      t.date :repeat_date

      t.timestamps null: false
    end
  end
end
