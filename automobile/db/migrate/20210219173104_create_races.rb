class CreateRaces < ActiveRecord::Migration[6.0]
  def change
    create_table :races do |t|
      t.string :date
      t.integer :total_laps
      t.string :total_time
      t.integer :best_lap
      t.string :time_best_lap
      t.string :diff
      t.string :gap
      t.integer :starting_grid
      t.decimal :average_velocity, precision: 10, scale: 2
      t.references :pilot, null: false, foreign_key: { to_table: :pilots }
      t.references :tournament, null: false, foreign_key: { to_table: :tournaments }
      t.references :automobile, null: false, foreign_key: { to_table: :automobiles }

      t.timestamps
    end
  end
end
