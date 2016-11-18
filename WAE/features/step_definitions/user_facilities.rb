
def make_products
  @prods = Array.new
  4.times { |n| @prods[n] = FactoryGirl.create :product, user: @current_user }
  #Create one product so that it belongs to admin so that only admin and no registered
  # user can edit/update it
end

# @current_user is available because this feature also include given I login as a registered user.
Given(/^I own some products$/) do
  make_products
  # 2 lines below are just for debug
  size = @current_user.products.size
  puts size.inspect
end

When(/^I visit my dashboard$/) do
  visit user_dashboard_path
  find(:css, 'h1').text.should == 'Dashboard'
end

Then(/^I should see list of all my products$/) do
  expect(page).to have_css('#product-list')
  find(:css, '#product-list thead th:nth-child(1)').text.should == 'Name of Product'
end

Then(/^I should see my basic activity summary\.$/) do
  expect(page).to have_css('#activity-summary')
  find(:css, '#activity-summary ul li:nth-child(1)').text.should == 'Total Posts'+@prods.size.to_s
  # find(:css, '#activity-summary ul li:nth-child(2)').text.should == 'Total Comments'
  # find(:css, '#activity-summary ul li:nth-child(3)').text.should == 'Last SignIn'
end

When(/^Owner visits his dashboard$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^He should see notification about new comment$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I visit my profile$/) do
  visit user_profile_path
  find(:css, 'h1').text.should == 'Profile'
end

Then(/^I should see my profile$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I try to edit my profile$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should be able to edit my profile$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
