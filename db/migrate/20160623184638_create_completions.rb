class CreateCompletions < ActiveRecord::Migration
  def change
    create_table :completions do |t|

    	t.boolean :completed
      t.references :user
    	t.date :date_complete
    	t.references :task
    	
      t.timestamps null: false
    end
  end
end
