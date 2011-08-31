@javascript
Feature: Friendship

  Scenario: Sending friendship request
    Given a user "John Doe"
    And I am logged in as "Vasya Pupkin"
    When I go to John's profile page
    And I press "Add friend"
    Then I should be on John's pofile page
    And I should see "John will be notified about your friendship request"

