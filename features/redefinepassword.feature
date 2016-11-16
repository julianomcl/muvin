Feature: As An User
  In order to update my password
  I want to redefine my password

  Scenario: Redefine Password
    Given that I am logged in with email "example@railstutorial.org" and password "foobar"
    And I am on the configuration view page
    When I press "Redefinir Senha"
    Then I should be on the redefine password page
    When I fill in "senha_atual" with "teste1"
    And I fill in "nova_senha" with "teste2"
    And I fill in "nova_senha_confirm" with "teste1"
    Then I should redefined my password

    
    