class CreateCompletions < ActiveRecord::Migration
  def change
    create_table :completions do |t|

    	t.boolean :completed, null: false
      t.references :user, null: false
    	t.date :date_complete, null: false
    	t.references :task
    	
      t.timestamps null: false
    end
  end
end
