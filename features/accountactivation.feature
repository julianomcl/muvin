Feature: As Product Manager
  So that the application has not false users
  I want the user to confirm you e-mail after registration

  Scenario: Account Activation
    Given that I am not logged in
    And I am on the Sign up page
    When I fill in "user_first_name" with "Juliano"
    And I fill in "user_last_name" with "Maia"
    And I fill in "user_email" with "leite.juliano@gmail.com"
    And I fill in "user_password" with "password"
    And I fill in "user_password_confirmation" with "password"
    And I fill in "user_lastfm_username" with "Juliano_maia"
    And I press "Cadastrar-se"
    When I access the activation link for email "leite.juliano@gmail.com"
    Then my account with email "leite.juliano@gmail.com" should be activated