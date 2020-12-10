class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.integer :suite
      t.string :city
      t.string :zipcode
      t.references :profile, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
