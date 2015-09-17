# Test Sweet

Integration testing your RubyMotion applications the simple and sweet way.

## Requirements

- **Test Sweet** uses [Appium](https://github.com/appium/appium#quick-start) for driving your integration tests.
- Head on over there and install based on the instructions they have provided.

## Installation

Add this line to your application's Gemfile:

    gem 'test_sweet'

And then execute:

    $ bundle
    $ rake test_sweet:initialize

## Usage

Start the Appium server

You can build and run your app together in one call
After you have initialized your **Test Sweet** you can add new features and run them with the provided rake task.

    $ rake test_sweet

Or if you prefer to pre-build your app with some setup on your side, you can just run the tests without the build task

    $ rake test_sweet:run

Finally you can also use the CLI runner to run your features not using rake

    $ test_sweet
    
## Built in Steps

##### Screenshot comparisms using motion-juxtapose
You can use this easily by simply providing a name for the screen, like so:

```Gherkin
# The simplest way, simply give the screen name that should be used to compare against
Then the screen should match "the login screen"

# If you need to provide a fuzz_factor to motion-juxtapose you can use this instead
Then the screen should match "the login screen" with a fuzz factor of 1

# Finally if you also want it to try less times by default to increase speed of your tests
Then the screen should match "the login screen" with a fuzz factor of 1 with 5 max attempts
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
