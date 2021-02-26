class CreatePilots < ActiveRecord::Migration[6.0]
  def change
    create_table :pilots do |t|
      t.string :name
      t.references :tournament, null: false, foreign_key: { to_table: :tournaments }

      t.timestamps
    end
  end
end
