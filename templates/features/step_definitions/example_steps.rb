Given(/^I touch the screen$/) do
  step %~I touch at position 160,100~
end

Then(/^the application should have opened properly$/) do
  expect(find_element(:xpath, "//UIAApplication[1]").is_a?(Selenium::WebDriver::Element)).to eq(true)
end
