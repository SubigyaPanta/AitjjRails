Given(/^I visit the user registration page$/) do
  visit new_user_registration_path
end

Given(/^I submit my details with ait asia email$/) do
  @ait_asia = FactoryGirl.build :NewAitAsiaUser
  fill_in "Email", with: @ait_asia.email
  fill_in "Password", with: @ait_asia.password
  fill_in "Password confirmation", with: @ait_asia.password_confirmation
  click_button "Sign up"
end

Then(/^Check that i am logged in with ait asia email$/) do
  visit ps_four_path
  expect(page).to have_content("Logged in as: " + @ait_asia.email)
end

Then(/^Logout$/) do
  visit ps_four_path
  click_link "Log Out"
end

Given(/^I submit my details with ait ac email$/) do
  @ait_ac = FactoryGirl.build :NewAitAcUser
  fill_in "Email", with: @ait_ac.email
  fill_in "Password", with: @ait_ac.password
  fill_in "Password confirmation", with: @ait_ac.password_confirmation
  click_button "Sign up"
end

Then(/^Check that i am logged in with ait ac email$/) do
  visit ps_four_path
  expect(page).to have_content("Logged in as: " + @ait_ac.email)
end

Given(/^I submit my details with other email$/) do
  @gmail = FactoryGirl.build :NewGmailUser
  fill_in "Email", with: @gmail.email
  fill_in "Password", with: @gmail.password
  fill_in "Password confirmation", with: @gmail.password_confirmation
  click_button "Sign up"
end

Then(/^I should see an error$/) do
  expect(page).to have_content("Email is invalid")
end


