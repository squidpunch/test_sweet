Then /^the screen should match "([^\"]*)" with fuzz factor of (\d+)$/ do |template, fuzz|
  step %~the screen should match "#{template}" with fuzz factor of #{fuzz} with 10 max attempts~
end

Then /^the screen should match "([^\"]*)"$/ do |template|
  step %~the screen should match "#{template}" with fuzz factor of 0 with 10 max attempts~
end

Then(/^the screen should match "([^\"]*)" with fuzz factor of (\d+) with (\d+) max attempts$/) do |name, fuzz, max_attempts|

  screenshotter = Juxtapose::Screenshotter.new(self, name, fuzz.to_i, File.expand_path('./'))

  expect(screenshotter.attempt_verify(max_attempts.to_i)).to eq(true)
end
