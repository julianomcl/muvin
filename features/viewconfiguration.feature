Feature: As An Registered User
  In order to vizualize the user's settings
  I want to access the settings page


  Scenario: User Viewer Configuration
    Given that I ain't logged in
    And I fill in "session_email" with "lucassantana@gmail.com"
    And I fill in "session_password" with "123456"
    And I press "Log in"
    And That I now logged in
    Then I should see my configurations
    