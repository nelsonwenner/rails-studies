class CreateAutomobiles < ActiveRecord::Migration[6.0]
  def change
    create_table :automobiles do |t|
      t.integer :number

      t.timestamps
    end
  end
end
