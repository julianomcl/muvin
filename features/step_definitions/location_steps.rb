Then(/^I should see "([^"]*)"$/) do |div|
  expect(page).to have_css(div)
end
