Then /^the screen should match "([^\"]*)"$/ do |template|
  screenshotter = Juxtapose::Screenshotter.new(self, template, 0, File.expand_path('./'))

  max_attempts = 10
  expect(screenshotter.attempt_verify(max_attempts)).to eq(true)
end
