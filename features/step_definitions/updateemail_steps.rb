Given(/^I am on the Login page$/) do
  visit :login
end

When(/^I visit Update Email page$/) do
  visit :updateemail
end

Then(/^My current e\-mail should be "([^"]*)"$/) do |email|
  pending # Write code here that turns the phrase above into concrete actions
end