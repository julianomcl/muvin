Then(/^I should visit the configuration view page$/) do
  visit :configurationviewer
end

Then(/^I should see my configurations$/) do
  expect(page.text).to have_content("Juliano")
  expect(page).to have_content("Maia")
  expect(page).to have_content("leite.juliano@gmail.com")
end