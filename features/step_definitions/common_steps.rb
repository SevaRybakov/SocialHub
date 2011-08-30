Given /^a user "(\w+) (\w+)"$/ do |name, surname|
  Factory.create :user,
                 :name => name,
                 :surname => surname,
                 :email => name + '.' + surname + '@gmail.com'
end

Given /^I am logged in as "(\w+) (\w+)"$/ do |name, surname|
  u = User.where(:name => name, :surname => surname).first ||
      Factory.create( :user,
                     :name => name,
                     :surname => surname,
                     :email => name + '.' + surname + '@gmail.com' )

  visit new_user_session_path
  fill_in('user[email]', :with => u.email)
  fill_in('user[password]', :with => u.password)
  click_button('user_submit')
end

When /^I browse profile page of "([^"]*)"$/ do |user|
  name, surname = user.split
  u = User.where(:name => name, :surname => surname).first ||
      Factory.create( :user,
                     :name => name,
                     :surname => surname,
                     :email => name + '.' + surname + '@gmail.com' )
  visit user_path 3
end

