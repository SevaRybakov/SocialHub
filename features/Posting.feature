@javascript
Feature: Posting

  Scenario: Post to my page
    Given I am logged in as "John Doe"
    When I fill in "post[content]" with "Hello from me!"
    And I press "Create Post"
    Then I should see "Hello from me!"
    And I should see "Show"
    And I should see "Edit"
    And I should see "Destroy"

  Scenario: Chatting
    When I am in Luke's browser
    And I am logged in as "Luke Skywalker"

    When I am in Darth's browser
    And I am logged in as "Darth Vader"
    And I go to Luke's profile page
    And I fill in "post[content]" with "Hello from Darth Vader!"
    And I press "Create Post"

    When I am in Luke's browser
    And I am waiting 5 seconds
    And I should see "Hello from Darth Vader!"

