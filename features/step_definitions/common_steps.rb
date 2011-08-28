Given /^a user "(\w+) (\w+)"$/ do |name, surname|
  Factory.create :user, 
                 :name => name, 
                 :surname => surname, 
                 :email => name + '.' + surname + '@gmail.com'
end
