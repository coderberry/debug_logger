# DebugLogger

When `puts` isn't enough.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add debug_logger

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install debug_logger

## Usage

Simply add the gem to your Gemfile and run `bundle install`. If you are using Rails, add the following initializer:

```ruby
# config/initializers/debug_logger.rb
DebugLogger.configure do |config|
  config.default_title = 'DEBUG'
  config.log_file = 'log/debug.log' # or "log/#{Rails.env}.log"
  config.line_char = '*'
end
```

- `default_title` is the default title for the log messages. It can be overridden by passing a title to the `log` method.
- `log_file` is the path to the log file. It can be overridden by passing a file path to the `log` method.
- `line_char` is the character used to draw the line around the log message.

Then, you can use the `log` method to log messages to the log file:

```ruby
DebugLogger.log(message: "This is a test")
```

### Example Usage

##### Simple Log

```ruby
DebugLogger.log(message: "This is a test")
```

adds the following to your logs:

```
2022-09-01 08:42:29.029488 I [12319:2720] DebugLogger -- ************************************ DEBUG ************************************
2022-09-01 08:42:29.029503 I [12319:2720] DebugLogger -- test
2022-09-01 08:42:29.029508 I [12319:2720] DebugLogger -- *******************************************************************************
```

##### Log with Title

```ruby
DebugLogger.log(message: "This is a test", title: "TEST")
```

adds the following to your logs:

```
2022-09-01 08:42:29.029488 I [12319:2720] DebugLogger -- ************************************ TEST *************************************
2022-09-01 08:42:29.029503 I [12319:2720] DebugLogger -- This is a test
2022-09-01 08:42:29.029508 I [12319:2720] DebugLogger -- *******************************************************************************
```

##### Log with Title and File

```ruby
DebugLogger.log(message: "This is logging to log/debug.log", title: "FILE TEST", file: "log/debug.log")
```

adds the following to _log/debug.log_:

```
2022-09-01 08:42:29.029488 I [12319:2720] DebugLogger -- ************************************ TEST *************************************
2022-09-01 08:42:29.029503 I [12319:2720] DebugLogger -- This is logging to log/debug.log
2022-09-01 08:42:29.029508 I [12319:2720] DebugLogger -- *******************************************************************************
```

##### Log with line_char of `~`

```ruby
DebugLogger.log(message: "This is a test", title: "TEST", line_char: "~")
```

adds the following to your logs:

```
2022-09-01 08:42:29.029488 I [12319:2720] DebugLogger -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ TEST ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
2022-09-01 08:42:29.029503 I [12319:2720] DebugLogger -- This is a test
2022-09-01 08:42:29.029508 I [12319:2720] DebugLogger -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
```

##### Log with block

```ruby
DebugLogger.log(title: 'DEBUG') { <<~DEBUG }
  Time: #{Time.new}
  Sum: #{1 + 2}
DEBUG
```

adds the following to your logs:

```
2022-09-01 08:42:29.029488 I [12319:2720] DebugLogger -- ************************************ DEBUG ************************************
2022-09-01 08:42:29.029503 I [12319:2720] DebugLogger -- Time: 2022-09-01 08:42:29 -0400
2022-09-01 08:42:29.029508 I [12319:2720] DebugLogger -- Sum: 3
2022-09-01 08:42:29.029508 I [12319:2720] DebugLogger -- *******************************************************************************
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake` to run the specs. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/coderberry/debug_logger. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/coderberry/debug_logger/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DebugLogger project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/coderberry/debug_logger/blob/main/CODE_OF_CONDUCT.md).
