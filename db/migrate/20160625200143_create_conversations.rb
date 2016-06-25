class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.belongs_to :group

      t.timestamps null: false
    end
  end
end
