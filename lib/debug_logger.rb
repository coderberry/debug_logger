# frozen_string_literal: true

require "semantic_logger"
require_relative "debug_logger/configuration"
require_relative "debug_logger/version"

module DebugLogger
  class << self
    attr_accessor :configuration, :logger
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.logger
    @logger ||= begin
      SemanticLogger.default_level = :trace
      SemanticLogger.add_appender(file_name: @configuration.log_file, formatter: :color)
      SemanticLogger["DebugLogger"]
    end
  end

  def self.log(message: nil, title: nil, &block)
    title ||= configuration.default_title
    line_char ||= configuration.line_char

    line_part_length = ((78 - title.length) / 2.0).to_i
    line_part = line_char * line_part_length
    pre = [line_part, title, line_part].join(' ')

    message ||= yield if block_given?

    logger.info pre
    case message
      when Hash
        logger.info JSON.pretty_generate(message)
      when String
        logger.info message
      else
        logger.info message.inspect
    end
    logger.info line_char * pre.length
  end
end

