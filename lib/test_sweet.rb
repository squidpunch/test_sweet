require "test_sweet/version"
require 'fileutils'
require "rubygems"
require "tasks/test_sweet"

class TestSweet
  def self.init
    `cucumber --init`

    spec = Gem::Specification.find_by_name("test_sweet")
    gem_root = spec.gem_dir

    files = [
      'features/support/env.rb',
      'features/step_definitions/core_steps.rb',
      'features/step_definitions/example_steps.rb',
      'features/step_definitions/screenshotting_steps.rb',
      'features/example.feature'
    ]

    files.each do |f|
      content = File.open("#{gem_root}/templates/#{f}", "r").read
      File.open(f, 'w+') { |file| file.write(content) }
    end
  end

  def self.verify_initialized
    begin
      File.new('features/support/env.rb')
      true
    rescue Errno::ENOENT
      false
    end
  end
end
