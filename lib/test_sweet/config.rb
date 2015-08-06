class TestSweet
  class Config
    def self.android?
      defined?(Motion::Project::AndroidConfig)
    end
  end
end
