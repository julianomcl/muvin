Given(/^that I ain't logged in$/) do
  session = nil
  visit :login
  fill_in "session_email", :with => "lucassantana@gmail.com"
  fill_in "session_password", :with => "123456"
  click_button "Log in"
end

Given(/That I now logged in$/) do
    visit :configurationviewer
end

Then(/^I should see my configurations$/) do
 User.find_by!(id: session[:user_id])
 # @user = User.find_by(id: session[:user_id])
  #expect(page.text).to have_content("Lucas")
  #expect(page).to have_content("Santana")
  #expect(page).to have_content("lucassantana@gmail.com")
end
