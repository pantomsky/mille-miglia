class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :surname
      t.string :home_address

      t.timestamps null: false
    end
  end
end
