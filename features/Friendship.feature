@javascript
Feature: Friendship

  Scenario: Sending friendship request
    Given a user "John Doe"
    And I am logged in as "Vasya Pupkin"
    When I go to John's profile page
    Then I should see "John Doe"