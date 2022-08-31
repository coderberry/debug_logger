module DebugLogger
  class Configuration
    attr_accessor :default_title, :log_file, :line_char

    def initialize
      @default_title = 'DEBUG'
      @log_file = 'log/debug.log'
      @line_char = '*'
    end
  end
end