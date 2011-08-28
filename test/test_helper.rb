ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

load "#{Rails.root}/db/seeds.rb"

class ActiveSupport::TestCase
    
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
