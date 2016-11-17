When(/^I visit the configuration view page$/) do
  visit '/configurationviewer'
end

Then(/^I should see my configurations$/) do
  pending
  #user = User.find_by_email("muller@gmail.com")
  user = User.find_by(id: session[:user_id])
  expect(user).to be_truthy
  #expect(user.email).to be 
  #expect(page.text).to have_content("freddie mercury")
  #expect(page.all).to have_text("Maia")
  #expect(page.all).to have_text("leite.juliano@gmail.com")
end

Given(/^that I am logged in with email "([^"]*)" and password "([^"]*)"$/) do |email, password|
  steps %Q{
    I am on the Log on page
    I fill in "session_email" with #{email}
    I fill in "session_password" with #{password}
    I press "Log in"
  }
end
