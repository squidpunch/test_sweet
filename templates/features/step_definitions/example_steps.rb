Given(/^I touch the screen$/) do
  step %~I touch at position 160,100~
end

Then(/^the application should have opened properly$/) do

  # this example is somewhat contrived, you would want to do something more
  # realistic to your actual application

  # on iOS we're our xpaths are like this
  #
  # on android they are like this
  #//android.view.View[1]

  # for this example to just work on both, we have to do some investigating,
  # again you probably would write your steps for the platform actually being
  # used
  #
  # You'd more likely find a field by name, and expect that it had the right
  # content, or tap on it...etc, but with a completely blank project there
  # really is nothing like that to write samples steps against.

  begin
    @root = find_element(:xpath, "//UIAApplication[1]")
  rescue Selenium::WebDriver::Error::NoSuchElementError
    @root = find_element(:xpath, "//android.view.View[1]")
  end

  expect(@root.is_a?(Selenium::WebDriver::Element)).to eq(true)
end
