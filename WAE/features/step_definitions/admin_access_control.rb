Given(/^I log in as an admin$/) do
  visit new_user_session_path

  @admin = FactoryGirl.create :AdminUser
  puts @admin.inspect
  # @adminRole = FactoryGirl.build :AdminRole
  # @admin.role = @adminRole
  fill_in "Email", with: @admin.email
  fill_in 'Password', with: @admin.password
  save_and_open_page
  click_button 'Log in'
  # save_and_open_page
end

Given(/^I visit administration path$/) do
  visit admin_path
  # save_and_open_page
end

Then(/^I should see the admin page contents$/) do
  expect(page).to have_content('User Statistics')
  expect(page).to have_content('Total Registered Users')
  expect(page).to have_content('No. of users logged in this week')
  expect(page).to have_content('No. of users logged in this month')

  expect(page).to have_content('User Manager')

  expect(page).to have_content('Recently Registered Users')
  expect(page).to have_css('table#recently-registered-users')
end

Given(/^I log in as a registered user$/) do
  visit new_user_session_path

  @registered = FactoryGirl.create :RegisteredUser
  puts @registered.inspect
  fill_in 'Email', with: @registered.email
  fill_in 'Password', with: @registered.password
  click_button 'Log in'
end

# Given(/^I \(registered\) visit the administration path$/) do
#   visit admin_path
#   save_and_open_page
# end

Then(/^I should not see the admin page contents$/) do
  expect(page).to have_no_content('User Statistics')
  expect(page).to have_no_content('Total Registered Users')
  expect(page).to have_no_content('No. of users logged in this week')
  expect(page).to have_no_content('No. of users logged in this month')

  expect(page).to have_no_content('User Manager')

  expect(page).to have_no_content('Recently Registered Users')
  expect(page).to have_no_css('table#recently-registered-users')
end

Then(/^I should be redirected to home page$/) do
  expect(page).to have_current_path(root_path)
end

Given(/^I am a public user$/) do
  visit new_user_session_path

  expect(page).to have_content('Log in')
  expect(page).to have_content('Sign up')
  expect(page).to have_no_content('Log Out')
end
