Given(/^that I am not logged in$/) do
  session = nil
end

Given(/^I am on the Sign up page$/) do
  visit :signup
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, content|
  fill_in field, :with => content
end

When(/^I press "([^"]*)"$/) do |button|
  click_button button
end

Then(/^I should be on the homepage$/) do
  assert_current_path '/'
end

Then(/^I should be a user of the system with email "([^"]*)"$/) do |email|
  User.find_by_email!(email)
end