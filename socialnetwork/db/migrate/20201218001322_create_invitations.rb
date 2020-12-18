class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.references :requester, null: false, foreign_key: { to_table: :profiles }
      t.references :guest, null: false, foreign_key: { to_table: :profiles }
      
      t.timestamps
    end
  end
end
