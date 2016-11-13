Then(/^I should visit the configuration view page$/) do
  visit '/configurationviewer'
end

Then(/^I should see my configurations$/) do
  #user = User.find_by_email("muller@gmail.com")
  user = User.find_by(id: session[:user_id])
  expect(user).to be_truthy
  #expect(user.email).to be 
  #expect(page.text).to have_content("freddie mercury")
  #expect(page.all).to have_text("Maia")
  #expect(page.all).to have_text("leite.juliano@gmail.com")
end

Given(/^That I am on the homepage$/) do
  visit root_path
  
end