Given(/^that I am not logged in$/) do
  session = nil
end

Given(/^I am on the Sign up page$/) do
  visit('/signup')
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  fill_in(arg1, :with => arg2)
end

When(/^I press "([^"]*)"$/) do |button|
  click_button(button)
  @current_user = Factory(:user, :email => email)
  cookies[:stub_user_id] = @current_user.id
end

Then(/^I should be on the homepage$/) do
  assert page.current_path == '/'
end

Then(/^I should be a user of the system$/) do
  session[:user_id] = cookies[:stub_user_id]
end