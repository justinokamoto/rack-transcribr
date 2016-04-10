require 'rack/body_proxy'
require "rack/transcribr/extensions"

module Rack

  class CommonLogger
    def log(env, status, header, began_at) end # Disable CommonLogger middleware
  end

  class Transcribr

    FORMAT = %{%s - %s [%s] "%s %s%s %s" %d %s %0.4f\n}

    def initialize(app, logger=nil)
      @app = app
      @logger = logger
    end

    def call(env)
      began_at = Time.now
      status, header, body = @app.call(env)
      header = Utils::HeaderHash.new(header)
      body = BodyProxy.new(body) { log(env, status, header, began_at) }
      [status, header, body]
    end

    private

    def log(env, status, header, began_at)
      now = Time.now
      length = extract_content_length(header)

      msg = FORMAT % [
        env['HTTP_X_FORWARDED_FOR'] || env["REMOTE_ADDR"] || "-",
        env["REMOTE_USER"] || "-",
        now.strftime("%d/%b/%Y:%H:%M:%S %z"),
        env["REQUEST_METHOD"],
        env["PATH_INFO"],
        env["QUERY_STRING"].empty? ? "" : "?"+env["QUERY_STRING"],
        env["HTTP_VERSION"],
        status.to_s[0..3],
        length,
        now - began_at ]

      logger = @logger || env["rack.errors"]

      if logger.respond_to?(:write)
        logger.write(colorize(env["REQUEST_METHOD"], msg))
      else
        logger << colorize(env["REQUEST_METHOD"], msg)
      end
    end

    def extract_content_length(headers)
      value = headers["CONTENT_LENGTH"] or return '-'
      value.to_s == '0' ? '-' : value
    end

    def colorize(method, msg)
      case method
      when "GET"
        msg.blue
      when "POST"
        msg.green
      when "PUT", "PATCH"
        msg.yellow
      when "DELETE"
        msg.red
      else
        msg
      end
    end
  end
end