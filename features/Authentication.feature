Feature: Authentication

  Scenario: Logging In
    Given a user "John Doe"
    And I am on the login page
    When I fill in "Email" with "john.doe@gmail.com"
    And I fill in "Password" with "password"
    And I click "Sign in"
    Then I should see "John Doe"
    And I should see "(It's you)"
    
    