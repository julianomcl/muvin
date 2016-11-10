Given(/^I am on the Login page$/) do
  visit :login
end

When(/^I fill "([^"]*)" with "([^"]*)"$/) do |session_email, email|
  fill_in session_email, :with => email
end

When(/^"([^"]*)" with "([^"]*)"$/) do |session_password, password|
  fill_in session_password, :with => password
 end

Then(/^I should visit Update Email page$/) do
  visit :updateemail
end

Then(/^My current e\-mail should to be with the new email$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
