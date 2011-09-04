@javascript
Feature: Albums
  As a user
  I want to be able to create albums
  So that I will be able to upload photos and keep my photo collection organized
  
  Scenario: Manipulating the albums
    Given I am logged in
    When I go to the home page
    And I follow "Photos"
    Then I should see "My albums"
    
    # Creating an album
    When I follow "Add new album"
    Then I should see "Create new album"
    When I fill in "Name" with "Summer 2011"
    And press "Create Album"
    Then I should see "successfully"
    And I should see "Summer 2011"
    
    # Editing an album
    When I follow "Rename"
    Then I should see "Rename album"
    When I fill in "Name" with "Winter 2010"
    And press "Update Album"
    Then I should see "renamed an album"
    And I should see "Winter 2010"
    And I should not see "Summer 2011"
    
    #Destroying an album
    When I am going to agree with the popup
    And I follow "Destroy"
    Then I should see "You've successfully deleted album"
    Then I should not see "Winter 2010"
    
