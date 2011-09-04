Given /^a user "(\w+) (\w+)"$/ do |name, surname|
  Factory.create :user,
                 :name => name,
                 :surname => surname,
                 :email => name + '.' + surname + '@gmail.com'
end

When /^I am logged in as "(\w+) (\w+)"$/ do |name, surname|
  u = User.where(:name => name, :surname => surname).first ||
  Factory.create(:user,
                 :name => name,
                 :surname => surname,
                 :email => name + '.' + surname + '@gmail.com')
  visit '/'
  fill_in('user[email]', :with => u.email)
  fill_in('user[password]', :with => u.password)
  click_button('user_submit')
end

Given /^I am logged in$/ do 
  @u = Factory.create(:user)
  visit '/'
  fill_in('user[email]', :with => @u.email)
  fill_in('user[password]', :with => @u.password)
  click_button('user_submit')
end


When /^I am in (.*) browser$/ do |name|
  Capybara.session_name = name
end

# Call it before an action that will cause dialog window to appear
When /^I am going to agree with the popup$/ do
  page.execute_script 'window.confirm = function () { return true }'
end

When /^I wait for (\d+) seconds{,1}$/ do |seconds|
  sleep seconds.to_i
end

