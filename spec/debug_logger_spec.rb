require "spec_helper"

describe DebugLogger do
  before do
    DebugLogger.configure do |config|
      config.default_title = "DEBUG"
      config.log_file = "./log/debug.log"
      config.line_char = "*"
    end
  end

  context "with default configuration" do
    before do
      DebugLogger.reset
    end

    it "logs to the logfile" do
      Timecop.freeze(Time.now) do
        DebugLogger.log(message: "test")

        log_output = File.read(DebugLogger.configuration.log_file)

        expect(log_output).to include("DebugLogger -- ************************************ DEBUG ************************************")
        expect(log_output).to include("DebugLogger -- test")
        expect(log_output).to include("DebugLogger -- *******************************************************************************")
      end
    end
  end
end
