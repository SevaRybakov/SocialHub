require 'spec_helper'

describe Friendship do
  
  john = Factory.create :user, :email => 'john@fb.com'
  mark = Factory.create :user, :email => 'mark@fb.com'
  fr = Friendship.create!( :user_id => @john.id, :friend_id => @mark.id )
  
  it "is not confirmed by default" do
    fr.is_confirmed.should == false
  end
  
end
