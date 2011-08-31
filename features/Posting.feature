Feature: Posting

  Scenario: Post to my page
    Given I am logged in as "John Doe"
    When I fill in "post[content]" with "Hello from me!"
    And I press "Create Post"
    Then I should see "Hello from me!"
    And I should see "Show"
    And I should see "Edit"
    And I should see "Destroy"

