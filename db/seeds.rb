# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#def delete_all
  puts "Deleting all..."
  User.delete_all
  Role.delete_all
#end

#def create_roles
  puts "Create roles..."
  Role.create(:name => "user")
  Role.create(:name => "admin")
#end

#def create_users
  puts "Create test users..."
  5.times do |i|
    user = User.new( :email => "u#{i}@sh.com", :password => "qwerty", :password_confirmation => "qwerty", :name => "Test", :surname => "User #{i}")
    user.roles << Role.find_by_name("user")
    user.save
  end
#end

#def email_confirmation
  puts "Email confirmation..."
  User.all.each do |u|
    u.confirmation_token = nil
    u.confirmed_at = Time.now
    u.save
  end
#end

#def add_admin_role
  puts "Adding admin role for u1@sh.com"
  user = User.first
  user.roles << Role.find_by_name("admin")
  user.save
#end

