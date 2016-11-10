Feature: Ability to add comments
  Logged in users should be able to add comments. But public should only be able to read comments

  Scenario: A user visits the website and wants to add a comment.

    Given I am a public user
    When I open comment box on a product
    Then I should not be able to add a comment
    And I should be redirected to login page with a message

    Given I log in as a registered user
    When I open comment box on a product
    Then I should be able to add a comment

