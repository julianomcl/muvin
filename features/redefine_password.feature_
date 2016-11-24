Feature: As An User
  In order to update my password
  I want to redefine my password

  Scenario: Redefine Password
    Given that I am logged in with email "example@railstutorial.org" and password "foobar"
    And I am on the configuration view page
    When I press "Redefinir Senha"
    Then I should be on the redefine password page
    When I fill in "senha_atual" with "foobar"
    And I fill in "nova_senha" with "teste"
    And I fill in "nova_senha_confirm" with "teste"
    Then I should have my password redefined 

    
    