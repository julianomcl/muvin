When(/^I visit the configuration view page$/) do
  visit :mysettings
end

Then(/^I should see my configurations$/) do
  expect(page).to have_content("Minhas Configurações")
end

Given(/^that I am logged in with email "([^"]*)" and password "([^"]*)"$/) do |email, password|
  step "I am on the Log on page"
  step "I fill in \"session_email\" with \"#{email}\""
  step "I fill in \"session_password\" with \"#{password}\""
  step "I press \"Log in\""
  step "I should be on the homepage"
end
