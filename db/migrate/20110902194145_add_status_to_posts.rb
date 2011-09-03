class AddStatusToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :is_status, :boolean
  end

  def self.down
    remove_column :posts, :is_status
  end
end

