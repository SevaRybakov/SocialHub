# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
puts "Deleting all..."
User.delete_all
Role.delete_all

puts "Create roles..."
Role.create!(:name => "user")
Role.create!(:name => "admin")

puts "Create test users..."
25.times do |i|
  user = User.new( :email => "u#{i}@sh.com", :password => "qwerty", :password_confirmation => "qwerty", :name => "Test", :surname => "User #{i}")
  user.roles << Role.find_by_name("user")
  user.save!
end

puts "Email confirmation..."
User.all.each do |u|
  u.confirmation_token = nil
  u.confirmed_at = Time.now
  u.save!
end

puts "Adding admin role for u0@sh.com"
user = User.first
user.roles << Role.find_by_name("admin")
user.save!

puts "Posts between users..."
User.all.each do |user_to|
  User.all.each do |user_from|
    post = Post.create!( :user_to => user_to, :user_from => user_from, :content => "Hello to #{user_to.name} #{user_to.surname} from #{user_from.name} #{user_from.surname}!", :post_type => "post", :created_at => Time.now - rand(10000) )
  end
end

