class CreatePilots < ActiveRecord::Migration[6.0]
  def change
    create_table :pilots do |t|
      t.string :name
      
      t.timestamps
    end
  end
end
