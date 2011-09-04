class CreateFriendsStatistics < ActiveRecord::Migration
  def self.up
    create_table :friends_statistics do |t|
      t.references :user
      t.integer :count

      t.timestamps
    end
  end

  def self.down
    drop_table :friends_statistics
  end
end
