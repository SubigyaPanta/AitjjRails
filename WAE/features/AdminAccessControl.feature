Feature: Only Admins should be able to see administration pages. Admins and SuperAdmins should be able to add user role.
  Adding / removing user role includes, providing a high permissions/priviliges or block/banning a user

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


    Scenario: Admin logs in and wants to change a user role

        Given I log in as an admin
        When I visit User Management path
        And I change user role to blocked user
        Then The role of the user must change from registered to blocked

