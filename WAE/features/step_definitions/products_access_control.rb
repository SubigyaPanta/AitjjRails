Given(/^I visit product page$/) do
  #create 4 products before visiting
  @prods = Array.new
  4.times { |n| @prods[n] = FactoryGirl.create :product, user: @current_user }
  #Create one product so that it belongs to admin so that only admin and no registered
  # user can edit/update it
  @prods << FactoryGirl.create( :product, user: @admin)
  visit products_path
end

Then(/^I should see list of available products$/) do
  # To see list title
  expect(page).to have_css('.panel-heading')
  # expect(page).to have_
  # For image and other details
  expect(page).to have_css('.panel-body')
  # For list description
  expect(page).to have_css('.panel-footer')
end

Then(/^I should not be able to edit any product$/) do
  expect(page).to have_no_css('.glyphicon-edit')
  expect(page).to have_no_link('Edit')
end

Then(/^I should be able edit only my product$/) do
  for product in @prods
    if product.user == @current_user
      expect(page).to have_css('.glyphicon-edit')
      expect(page).to have_link('Edit', :href => edit_product_path(product))
      puts edit_product_path(product)
    end
  end
end

Then(/^I should not be able to edit other's product$/) do
  for product in @prods
    if product.user != @current_user
      expect(page).to have_no_link('Edit', :href => edit_product_path(product))
      puts edit_product_path(product)
    end
  end
end

Then(/^I should be able to edit any product$/) do
  for product in @prods
    expect(page).to have_link('Edit', :href => edit_product_path(product))
    puts edit_product_path(product)
  end
end

When(/^I click on the product title$/) do
    find(:xpath, "//a[@href='"+product_path(@prods[1])+"']").click
end

When(/^I click on the product image$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should go to product detail page$/) do
  expect(page).to have_current_path(product_path(@prods[1]))
  # puts product_path(@prods[1])
end

############ Comment Section ################
def make_products
  @prods = Array.new
  4.times { |n| @prods[n] = FactoryGirl.create :product, user: @current_user }
  #Create one product so that it belongs to admin so that only admin and no registered
  # user can edit/update it
  @prods << FactoryGirl.create( :product, user: @admin)
end

When(/^I try to comment on a product/) do
  make_products
  # find(:xpath, "//span[@data-comment='"+@prods[1].id+
  visit products_path
  fill_in 'product-'+@prods[1].id.to_s, with: 'My comment'
  find(:css, '#button-'+@prods[1].id.to_s).click

  page.evaluate_script("            $.ajax({
                url: window.location.origin + '/comments.json',
                method: 'post',
                dataType: 'json',
                data: {
                    comment: {
                        content: 'My comment',
                        product_id: id
                    }
                }
});")

end

Then(/^I should not be able to add a comment$/) do
  # find(:css, '#alert-container-'+@prods[1].id.to_s )
  # save_and_open_page
  # Has no child elements
  visit product_path(@prods[1])
  puts product_path(@prods[1])
  save_and_open_page
  find('#alert-container-'+@prods[1].id.to_s + ' div:nth-child(1)').all('*').length.should == 0
  # Has no text
  find('#alert-container-'+@prods[1].id.to_s + ' div:nth-child(1)').text.should == ''
end

Then(/^I should be redirected to login page with a message$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should be able to add a comment$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

