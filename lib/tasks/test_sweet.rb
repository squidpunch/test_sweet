namespace :test_sweet do
  desc "Initial setup of Test Sweet"
  task :initialize do
    if TestSweet.verify_initialized
      puts "TestSweet seems to already be initialized, start testing!"
    else
      TestSweet.init
      puts "TestSweet has been setup, write your features and run again!"
    end
  end

  task :prepare do
    Rake::Task["build:simulator"].invoke
  end

  desc "Run integration tests"
  task :run do
    if TestSweet.verify_initialized
      Rake::Task["test_sweet:prepare"].invoke
      ENV['test_sweet-target'] = Motion::Project::App.config.deployment_target
      ENV['test_sweet-app'] = Motion::Project::App.config.app_bundle('iPhoneSimulator')
      ENV['test_sweet-device-name'] = Motion::Project::App.config.device_family_string(
        ENV['device'],
        Motion::Project::App.config.device_family_ints[0],
        ENV['test_sweet-target'],
        ENV['retina'])

      exec("cucumber")
    else
      Rake::Task["test_sweet:initialize"].invoke
    end
  end
end
desc "Shorthand for test_sweet:run"
task :test_sweet => ["test_sweet:run"]
