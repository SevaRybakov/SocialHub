# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'John'
    surname 'Doe'
    email 'john.doe@gmail.com'
    password 'password'
    confirmed_at Time.now
  end  
end