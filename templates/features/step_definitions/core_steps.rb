Given(/^I wait for (\d+) seconds$/) do |seconds|
  sleep seconds.to_i
end

When(/^I touch at position (\d+),(\d+)$/) do |x, y|
  Appium::TouchAction.new.press(x: x, y: y, fingers: 1, tapCount: 1, duration: 0.5).perform
end

When(/^I touch "([^"]*)"$/) do |view_name|
  find_element(:name, view_name).click
end
