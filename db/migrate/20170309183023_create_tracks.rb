class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :origin_address
      t.string :dest_address
      t.float :distance

      t.timestamps null: false
    end
  end
end
