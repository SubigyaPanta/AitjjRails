Feature: User should have a dashboard
  A dashboard for each user should provide them their activity insight.

  Scenario: A registered user wants to see his activity summary / products posted.

    Given I log in as a registered user
    And I own some products
    When I visit my dashboard
    Then I should see list of all my products
    And I should see my basic activity summary.