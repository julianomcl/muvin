And(/^I am on the LastFM account update page$/) do
    visit "/mysettings/configurelastfm"
end

Then(/^My user "([^"]*)" lastfm username should be "([^"]*)"$/) do |email, lastfm_username|
    expect(User.find_by_email!(email).lastfm_username).to eq(lastfm_username)
end
