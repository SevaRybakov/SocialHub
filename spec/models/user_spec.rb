require 'spec_helper'

describe User do
  subject { Factory.create :user}
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should_not allow_value("bacon").for :email }
    it { should allow_value("a@b.com").for :email }
    it { should validate_presence_of :name }
    it { should validate_presence_of :surname }

    it "should be able to send friendship request to other user" do
      john = Factory.create( :user, :email => 'john.doe@hashrocket.com')
      mark = Factory.create( :user, :email => 'mark@fb.com')
      Friendship.create( :user_id => john.id, :friend_id => mark.id )

      john.wanted_friends.should include mark
      mark.potential_friends.should include john
      
      
    end
    
    it "should be able to confirm friendship request" do
      john = Factory.create( :user, :email => 'john.doe@hashrocket.com')
      mark = Factory.create( :user, :email => 'mark@fb.com')
      request = Friendship.create( :user_id => john.id, :friend_id => mark.id )
      
      request.confirm
      
      (john.friend_of? mark).should be_true
      (mark.friend_of? john).should be_true      
    end
end
