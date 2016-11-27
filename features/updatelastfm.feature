Feature: As a registered user
  So that i can update my lastfm account
  I want to be able to alter it

Scenario: LastFM account update
    Given that I am logged in with email "example@railstutorial.org" and password "foobar"
    And I am on the LastFM account update page
    And I fill in "user_lastfm_username" with "test_link"
    And I press "Atualizar"
    Then My user "example@railstutorial.org" lastfm username should be "test_link"