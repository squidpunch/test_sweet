require "fileutils"
require "rubygems"
require "tasks/test_sweet"
require "cucumber/rake/task"
require "test_sweet/version"
require "test_sweet/config"

class TestSweet
  def self.init
    `cucumber --init`

    spec = Gem::Specification.find_by_name("test_sweet")
    gem_root = spec.gem_dir

    files = [
      "features/example.feature",
      "features/step_definitions/example_steps.rb",
      "features/support/env.rb"
    ]

    files.each do |f|
      content = File.open("#{gem_root}/templates/#{f}", "r").read
      File.open(f, "w+") { |file| file.write(content) }
    end
  end

  def self.verify_initialized
    begin
      File.new("features/support/env.rb")
      true
    rescue Errno::ENOENT
      false
    end
  end
end
