@javascript
Feature: Friendship

  Scenario: Sending friendship request
<<<<<<< HEAD
    Given a user "John Doe"
    And I am logged in as "Vasya Pupkin"
    When I go to John's profile page
    Then I should see "John Doe"
=======
    And I am logged in as "Vasya Pupkin"
    When I browse profile page of "Jack Daniel"
    Then I should see "Jack"
>>>>>>> Fixed User Controller bag that didn't allow user to browse other user pages. Started work on cucumber for Add Friend Subfeature
