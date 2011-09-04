class AddIndexToPhotos < ActiveRecord::Migration
  def self.up
    add_index :photos, :album_id
  end

  def self.down
    remove_index :photos, :album_id
  end
end
