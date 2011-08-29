require 'spec_helper'

describe Friendship do
  
  before(:each) do
    @john = Factory.create :user, :email => 'john@fb.com'
    @mark = Factory.create :user, :email => 'mark@fb.com'
    @fr = Friendship.create!( :user_id => @john.id, :friend_id => @mark.id )
  end
  
  it "should not confirmed by default" do
    @fr.is_confirmed.should == false
  end
  
  it "should spawn it's inverted clone on confirmation" do
    @fr.is_confirmed = true
    @fr.save
    clones = Friendship.where( :user_id => @mark.id, :friend_id => @john.id )
    clones.count.should == 1
  end
  
  #it "should delete it's inverted clone on destruction" do
  #  @fr.is_confirmed = true
  #  @fr.save
  #  @fr.delete
  #  clones = Friendship.where :user_id => @mark.id, :friend_id => @john.id
  #  clones.should be_empty
  #end
  
end
