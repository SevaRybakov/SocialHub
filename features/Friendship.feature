@javascript
Feature: Friendship

  Scenario: Sending friendship request
    And I am logged in as "Vasya Pupkin"
    When I browse profile page of "Jack Daniel"
    Then I should see "Jack"