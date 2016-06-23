class CreateCompletions < ActiveRecord::Migration
  def change
    create_table :completions do |t|

    	t.boolean :completed
    	t.integer :completer_id
    	t.date :date_complete
    	t.references :task
    	
      t.timestamps null: false
    end
  end
end
