class CreatePilotCarRaces < ActiveRecord::Migration[6.0]
  def change
    create_table :pilot_car_races do |t|
      t.references :race, null: false, foreign_key: { to_table: :races }
      t.references :pilot, null: false, foreign_key: { to_table: :pilots }
      t.references :car, null: false, foreign_key: { to_table: :cars }

      t.timestamps
    end
  end
end
