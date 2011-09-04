class Photo < ActiveRecord::Base
  belongs_to :album
  
  has_attached_file :image
end


# == Schema Information
#
# Table name: photos
#
#  id                 :integer         not null, primary key
#  album_id           :integer
#  name               :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

