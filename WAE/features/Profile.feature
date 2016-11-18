Feature: User should be able to edit / update their basic profile
  Profile has a user's basic information which they can edit and update

  Scenario: A registered user wants to view his profile

    Given I log in as a registered user
    When I visit my profile
    Then I should see my profile
    When I try to edit my profile
    Then I should be able to edit my profile