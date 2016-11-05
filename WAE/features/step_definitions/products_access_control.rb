Given(/^I visit product page$/) do
  #create 4 products before visiting
  4.times { product = FactoryGirl.create :product, user: @current_user }
  visit products_path
end

Then(/^I should see list of available products$/) do
  # To see list title
  save_and_open_page
  expect(page).to have_css('.panel-heading')
  # expect(page).to have_
  # For image and other details
  expect(page).to have_css('.panel-body')
  # For list description
  expect(page).to have_css('.panel-footer')
end

Then(/^I should not be able to edit any product$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should be able edit only my product$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should not be able to edit other's product$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should be able to edit any product$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I click on the product title or image$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should go to product detail page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
