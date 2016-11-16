Feature: As An Anonymous User
  In order to use Muvins features
  I want to log on

  Scenario: User Log on
    Given that I am not logged in
    And I am on the Log on page
    And I fill in "session_email" with "example@railstutorial.org"
    And I fill in "session_password" with "foobar"
    And I press "Log in"
    Then I should be on the homepage
    
   