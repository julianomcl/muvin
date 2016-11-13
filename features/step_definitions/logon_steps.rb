Given(/^I am on the Log on page$/) do
  visit :login
end

When(/^I fill in "([^"]*)" with my registered email$/) do |arg1|
  fill_in field, :with => email
end

When(/^I fill in "([^"]*)" with my registered password$/) do |arg1|
 fill_in field, :with => password
end