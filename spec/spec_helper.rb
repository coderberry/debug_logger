require 'pry'
require 'debug_logger'
require 'timecop'

RSpec.configure do |config|
  config.after(:each) do
    # Reset the log file before each spec
    File.truncate(DebugLogger.configuration.log_file, 0)
  end
end
