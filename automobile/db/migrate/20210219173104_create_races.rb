class CreateRaces < ActiveRecord::Migration[6.0]
  def change
    create_table :races do |t|
      t.string :date
      t.references :tournament, null: false, foreign_key: { to_table: :tournaments }

      t.timestamps
    end
  end
end
