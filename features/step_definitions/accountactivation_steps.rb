When(/^I access the activation link for email "([^"]*)"$/) do |email|
  user = User.find_by_email(email)
  user.activate
end

Then(/^my account with email "([^"]*)" should be activated$/) do |email|
  user = User.find_by_email(email)
  expect(user.activated).to be true
end