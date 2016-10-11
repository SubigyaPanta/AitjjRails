Feature: User Registration
  A new user who wants to login, should be able to register himself on the system.

  Scenario: I want to register myself with Ait email address

    Given I visit the user registration page
    And I submit my details with ait asia email
    Then Check that i am registered with ait asia email
    And Logout

    Given I visit the user registration page
    And I submit my details with ait ac email
    Then Check that i am registered with ait ac email
    And Logout


  Scenario: I want to register myself with other email address

    Given I visit the user registration page
    And I submit my details with other email
    Then I should see "Email is invalid" error


  Scenario: I want to login using Ait email address

    Given I visit user login page
    And I submit my ait asia login credentials
    Then Check that i am logged in with ait asia email
    And Logout

    Given I visit user login page
    And I submit my ait ac login credentials
    Then Check that i am logged in with ait ac email
    And Logout


  Scenario: I want to login using other email address

    Given I visit user login page
    And I submit my other email address
    Then I should stay in the same page unable to login


