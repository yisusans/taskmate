class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
    	t.integer :invitee_id, null: false
    	t.integer :inviter_id, null: false
    	t.references :group
    	t.string :status, default: "pending"

      t.timestamps null: false
    end
  end
end
