require "rack/transcribr/extensions"

module Rack
  class Transcribr
    def initialize(app, args)
      @app = app
      @filepath = args["log_filepath"] || "./raw_html.log"
    end 

    def call(env)
      status, headers, response = @app.call(env)
      log_file = File.new(@filepath, "w")

      headers.each do |line|
        log_file.puts(line)
      end
      response.each do |line|
        log_file.puts(line)
      end

      log_file.close

      [status, headers, response]
    end
  end
end