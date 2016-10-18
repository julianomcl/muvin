Feature: As An Anonymous User
  In order to use Muvins features
  I want to sign up for a new account

  Scenario: User Sign Up
    Given that I am not logged in
    And I am on the Sign up page
    When I fill in "user_first_name" with "Juliano"
    And I fill in "user_last_name" with "Maia"
    And I fill in "user_email" with "leite.juliano@gmail.com"
    And I fill in "user_password" with "password"
    And I fill in "user_lastfm_username" with "Juliano_maia"
    And I press "Cadastrar-se"
    Then I should be on the homepage
    And I should be a user of the system