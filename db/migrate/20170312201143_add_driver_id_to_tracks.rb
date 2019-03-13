class AddDriverIdToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :driver_id, :integer
    add_index :tracks, :driver_id
  end
end
