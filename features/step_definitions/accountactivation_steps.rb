When(/^I access the activation link for email "([^"]*)"$/) do |email|
  pending
  user = User.find_by_email(email)
  get ("/account_activations/#{user.activation_token}/edit?email=#{email}")
end

Then(/^my account with email "([^"]*)" should be activated$/) do |email|
  user = User.find_by_email(email)
  expect(user.activated).to be true
end