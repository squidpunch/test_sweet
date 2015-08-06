namespace :test_sweet do
  desc "Initial setup of Test Sweet"
  task :initialize do
    if !TestSweet.verify_initialized
      TestSweet.init
      puts "TestSweet has been setup, write your features and start testing!"
    end
  end

  desc "Run integration tests"
  task :run do
    if TestSweet.verify_initialized
      if TestSweet::Config.android?
        ENV['test_sweet-platform'] = "Android"
        ENV['test_sweet-app'] = Motion::Project::App.config.apk_path
      else
        ENV['test_sweet-target'] = Motion::Project::App.config.deployment_target || ENV['target']
        ENV['test_sweet-app'] = Motion::Project::App.config.app_bundle('iPhoneSimulator')
        ENV['test_sweet-platform'] = "iOS"
        ENV['test_sweet-device-name'] = Motion::Project::App.config.device_family_string(
          ENV['device'],
          Motion::Project::App.config.device_family_ints[0],
          ENV['test_sweet-target'],
          ENV['retina'])
      end

      if !File.exists? ENV['test_sweet-app']
        puts "No application at #{ENV['test_sweet-app']} - please build your app!"
      else
        Cucumber::Rake::Task.new(:features, "") do |t|
          t.cucumber_opts = "--format pretty #{ENV["FEATURES"] || "features"}"
        end.runner.run
      end
    else
      puts "TestSweet is not initialized; please run: `rake test_sweet:initialize`"
    end
  end
end

desc "Build your app and run integration tests"
task :test_sweet do
  Rake::Task["build:simulator"].invoke
  Rake::Task["test_sweet:run"].invoke
end
