require "rack/transcribr/extensions"

module Rack
  class Transcribr
    def initialize(app)
      @app = app
      # @filepath = args["log_filepath"] || "./raw_html.log"
    end 

    def call(env)
      status, headers, response = @app.call(env)

      # log_file = File.new(@filepath, "w")
      body = ""
      puts headers["Content-Type"]
      puts "USER AGENT".red
      puts headers
      puts "ENV"
      puts env
      response.each { |line| puts line }
      response.each { |line| body << line }
      body << hello_world
      headers["Content-Length"] = body.length.to_s
      response = [body]
      # if headers["Content-Type"] =~ /text\/html|application\/xhtml\+xml/
      #   puts "html"
      #   body = ""
      #   response.each { |part| body << part; puts part }
      #   index = body.rindex("</body>")


      #   if index
      #     body.insert(index, hello_world)
      #     headers["Content-Length"] = body.length.to_s
      #     response = [body]
      #   end
      # else
      #   puts "not html"
      #   body = ""
      #   response.each { |part| body << part; puts }
      # end

      [status, headers, response]
    end

    def hello_world
      returning_value = <<-EOF
<script type="text/javascript">
console.log("Hello, world.");
</script>
EOF
      returning_value
    end
  end
end

# Logs header request information