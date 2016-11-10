Given(/^that I am logged in$/) do
  visit :login
  fill_in "session_email", :with => "lucassantana@gmail.com"
  fill_in "session_password", :with => "123456"
  click_button "Log in"
end

When(/^I am on the configuration view page$/) do
  visit :configurationviewer
end

Then(/^I should see my configurations$/) do
  expect(page.text).to have_content("Lucas")
  expect(page).to have_content("Santana")
  expect(page).to have_content("lucassantana@gmail.com")
end


