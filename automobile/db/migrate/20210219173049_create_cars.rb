class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.integer :number
      t.references :tournament, null: false, foreign_key: { to_table: :tournaments }

      t.timestamps
    end
  end
end
