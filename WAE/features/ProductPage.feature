Feature: Add, View and Edit Product Items.


  Scenario: Public user visits product page.

    Given I am a public user
    And I visit product page
    Then I should see list of available products
    And I should not be able to edit any product

  Scenario: Registered user visits product page.

    Given I log in as a registered user
    And I visit product page
    Then I should see list of available products
    And I should be able edit only my product
    But I should not be able to edit other's product

  Scenario: Admin user visits product page.

    Given I log in as an admin
    And I visit product page
    Then I should see list of available products
    And I should be able to edit any product


  Scenario: A user clicks on the product in product list.

    Given I am a public user
    And I visit product page
    When I click on the product title
    Then I should go to product detail page
#    When I click on the product image
#    Then I should go to product detail page