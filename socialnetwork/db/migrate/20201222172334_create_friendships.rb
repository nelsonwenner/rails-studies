class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.references :profile, null: false, foreign_key: { to_table: :profiles }
      t.references :friend, null: false, foreign_key: { to_table: :profiles }
      
      t.timestamps
    end
  end
end
