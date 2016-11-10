Feature: As An Registered User
  In order to update my e-mail
  I want to alter my e-mail in database


  Scenario: User Update Email
    Given that I am logged in
    When I am on the Update page
    And I fill in "current_email" with "lucassantana@gmail.com"
    And I fill in "new_email" with "lucassantana.402@gmail.com"
    And I press "Confirm"
    Then My e-mail should to be with the new email