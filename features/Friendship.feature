@javascript
Feature: Friendship

  Scenario: Sending friendship request and approving friendship
    When I am in Luke's browser
    And I am logged in as "Luke Skywalker"
    
    When I am in Darth's browser
    And I am logged in as "Darth Vader"
    And I go to Luke's profile page
    And I follow "Add friend"
    Then I should be on Luke's profile page
    And I should see "Luke will be notified about your friendship request"
    And should not see "Add friend"
    
    When I am in Luke's browser
    And I am logged in as "Luke Skywalker"
    Then I should see "+1"
    
  
