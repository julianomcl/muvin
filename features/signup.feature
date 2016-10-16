Feature: As An Anonymous User
  In order to use Muvins features
  I want to sign up for a new account

  Scenario: User Sign Up
    Given that I am not logged in
    And I am on the Sign up page
    When I fill in "name" with "Juliano"
    And I fill in "Sobrenome" with "Maia"
    And I fill in "Email" with "leite.juliano@gmail.com"
    And I fill in "Senha" with "123"
    And I fill in "Usuario lastfm" with "Juliano_maia"
    And I press "Cadastrar-se"
    Then I should be on the homepage
    And I should be a user of the system