Feature: As User
  So that I can navigate through the website pages
  I want that the website has a navigation menu

  Scenario: Navigation Menu
    Given that I am on the homepage
    When I click on "Cadastre-se"
    Then I should be on the sign up page
    When I click on "Login"
    Then I should be on the login page
    When I click on "Muvin"
    Then I should be on the homepage