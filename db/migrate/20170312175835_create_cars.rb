class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :number
      t.string :mark
      t.string :model
      t.float :engine

      t.timestamps null: false
    end
  end
end
