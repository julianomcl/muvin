Feature: As An Registered User
  In order to update my e-mail
  I want to alter my e-mail in database


  Scenario: User Update Email
   Given that I am not logged in 
    And I am on the Login page
    When I fill "session_email" with "leite.juliano@gmail.com" 
    And "session_password" with "password"
    And I press "Log in"
    Then I should visit Update Email page
    And I fill "current_email" with "lucassantana@gmail.com" 
    And "future_email" with "lucassantana.402@gmail.com"
    And I press "Confirm"
    And My current e-mail should to be with the new email