Given(/^I am on the Login page$/) do
  visit :login
end

When(/^I visit Update Email page$/) do
  pending
  visit :updateemail
end

Then(/^My current e\-mail should be "([^"]*)"$/) do |email|
  visit :login
end
