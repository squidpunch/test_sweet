require 'rspec'
require 'appium_lib'
require 'motion-juxtapose'
require "test_sweet/core_steps"
require "test_sweet/screenshotting_steps"

Juxtapose::AppiumStrategy.setup

# Create a custom World class so we don't pollute `Object` with Appium methods
class AppiumWorld; end

caps = {
  caps: {
    automationName: ENV['test_sweet-automation'],
    platformName: ENV['test_sweet-platform'],
    platformVersion: ENV['test_sweet-target'],
    app: ENV['test_sweet-app'],
    deviceName: ENV['test_sweet-device-name'],
    noReset: ENV['test_sweet-no-reset']
  }
}
Appium::Driver.new(caps, true)

Appium.promote_appium_methods AppiumWorld

World do
  AppiumWorld.new
end

Before { $driver.start_driver }
After { $driver.driver_quit }
