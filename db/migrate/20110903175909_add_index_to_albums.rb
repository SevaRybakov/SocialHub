class AddIndexToAlbums < ActiveRecord::Migration
  def self.up
    add_index :albums, :user_id
  end

  def self.down
    remove_index :albums, :user_id
  end
end
