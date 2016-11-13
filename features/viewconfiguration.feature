Feature: As An Registered User
  In order to vizualize the user's settings
  I want to access the settings page


  Scenario: User Viewer Configuration
    Given that I am not logged in 
    And I am on the Login page
    When I fill "session_email" with "muller@gmail.com" 
    And "session_password" with "123456"
    Given That I am on the homepage
    Then I should visit the configuration view page
    And I should see my configurations
    