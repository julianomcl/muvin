When(/^I visit the configuration view page$/) do
  visit :mysettings
end

Then(/^I should see my configurations$/) do
  pending
end

Given(/^that I am logged in with email "([^"]*)" and password "([^"]*)"$/) do |email, password|
  steps %Q{
    I am on the Log on page
    I fill in "session_email" with #{email}
    I fill in "session_password" with #{password}
    I press "Log in"
  }
end
