require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: posts
#
#  id           :integer         not null, primary key
#  user_to_id   :integer
#  user_from_id :integer
#  content      :string(255)
#  post_type    :string(255)
#  media_url    :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

