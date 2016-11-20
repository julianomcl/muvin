Given(/^that I am on the homepage$/) do
  visit root_path
end

When(/^I click on "([^"]*)"$/) do |link|
  click_link link
end

Then(/^I should be on the sign up page$/) do
  assert_current_path sign_up_path
end

Then(/^I should be on the login page$/) do
  assert_current_path login_path
end
