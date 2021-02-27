class CreateClassifications < ActiveRecord::Migration[6.0]
  def change
    create_table :classifications do |t|
      t.integer :total_laps
      t.string :total_time
      t.integer :best_lap
      t.string :time_best_lap
      t.string :diff
      t.string :gap
      t.integer :starting_grid
      t.decimal :average_velocity, precision: 10, scale: 2
      t.references :pilot_car_race, null: false, foreign_key: { to_table: :pilot_car_races }

      t.timestamps
    end
  end
end
