
def make_products_with_comments
  @prods = Array.new
  4.times { |n| @prods[n] = FactoryGirl.build_stubbed :product, :with_comments, :number_of_comments => 3}
end

Then(/^I should see a link to view comments$/) do
  make_products_with_comments
  puts @prods[0].comments.size
  visit products_path
  save_and_open_page
  find(:css, '.comment-link')
end

When(/^I click on the link$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^Then I should be able to read comments$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
