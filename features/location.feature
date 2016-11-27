Feature: As An User
  So that I can see the most heard song in my area
  I want to center the map at my current location

  Scenario: Get My Location
    Given that I am on the homepage
    Then I should see "div#map"