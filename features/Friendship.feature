@javascript
Feature: Friendship

  Scenario: Sending friendship request and approving friendship
    Given a user "Luke Skywalker"
    
    When I am in Darth's browser
    When I am logged in as "Darth Vader"
    And I go to Luke's profile page
    And I follow "Add friend"
    Then I should be on Luke's profile page
    And I should see "Luke will be notified about your friendship request"
    And should not see "Add friend"
    
  
