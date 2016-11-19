Feature: Ability to add comments
  Logged in users should be able to add comments. But public should only be able to read comments

  Scenario: A user visits the website and wants to add a comment.

    Given I am a public user
    When I try to comment on a product
    Then I should not be able to add a comment
    And I should be redirected to login page with a message

    Given I log in as a registered user
    When I try to comment on a product
    Then I should be able to add a comment


  Scenario: A registered User added a comment successfully.

    Given I log in as a registered user
    And I try to comment on a product
    And I should be able to add a comment

    When Owner visits his dashboard
    Then He should see notification about new comment


  Scenario: A user wants to see comments on a product

    Given I log in as a registered user
    And I visit product page
    Then I should see a link to view comments
    When I click on the link
    Then Then I should be able to read comments

