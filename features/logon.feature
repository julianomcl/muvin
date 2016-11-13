Feature: As An Anonymous User
  In order to use Muvins features
  I want to log on

  Scenario: User Log on
    Given that I am not logged in
    And I am on the Log on page
    When I fill in "session_email" with "teste@teste.com"
    And I fill in "session_password" with "123456"
    And I press "Log in"
    Then I should be on the homepage
    
   