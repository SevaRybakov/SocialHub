class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.references :user_to
      t.references :user_from
      t.string :content
      t.string :post_type
      t.string :media_url

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end

