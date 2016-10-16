Feature: Only Admins should be able to see administration pages


  Scenario: An admin logs in and wants to see administration page

    Given I log in as an admin
    And I visit administration path
    Then I should see the admin page contents


  Scenario: A registered user logs in and wants to see administration page

    Given I log in as a registered user
    And I visit administration path
    Then I should not see the admin page contents
    And I should be redirected to home page


  Scenario: Public user wants to see administration page

    Given I am a public user
    And I visit administration path
    Then I should not see the admin page contents
    And I should be redirected to home page