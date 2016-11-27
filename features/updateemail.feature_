Feature: As An Registered User
  In order to update my e-mail
  I want to alter my e-mail in database


  Scenario: User Update Email
    Given that I am logged in with email "example@railstutorial.org" and password "foobar"
    When I visit Update Email page
    And I fill in "current_email" with "example@railstutorial.org"
    And I fill in "future_email" with "lucassantana.402@gmail.com"
    And I press "Confirm"
    Then My current e-mail should be "lucassantana.402@gmail.com"