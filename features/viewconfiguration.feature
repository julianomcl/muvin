Feature: As An Registered User
  In order to vizualize the user's settings
  I want to access the settings page


  Scenario: User Viewer Configuration
    Given that I am not logged in 
    And I am on the Login page
    When I fill "session_email" with "leite.juliano@gmail.com" 
    And "session_password" with "password"
    Then I should visit the configuration view page
    And I should see my configurations
    