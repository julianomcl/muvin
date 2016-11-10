Feature: As An Registered User
  In order to vizualize the user's settings
  I want to access the settings page


  Scenario: User Viewer Configuration
    Given that I am logged in
    When I am on the configuration view page
    Then I should see my configurations
    