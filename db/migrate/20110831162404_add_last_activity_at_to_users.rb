class AddLastActivityAtToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :last_activity_at, :datetime
  end

  def self.down
    remove_column :users, :last_activity_at
  end
end
