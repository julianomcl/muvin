Feature: As An Anonymous User
  In order to use Muvins features
  I want to log on

  Scenario: User Log on
    Given that I am not logged in
    And I am on the Log on page
    And I am a registered user
    When I fill in "user_email" with my registered email
    And I fill in "user_password" with my registered password
    And I press "Login"
    Then I should be on the homepage
    
   