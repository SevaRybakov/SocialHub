class Photo < ActiveRecord::Base
  belongs_to :album
  
  has_attached_file :image, :styles => { :small => '200x200>', :album_pic => '200x200#'}
  
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 2.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
  
  def url(arg)
    self.image.url(arg)
  end
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

