
require "stringio"

module Lti2Commons
  
  module WireLogSupport
    
    class WireLog
      STATUS_CODES = {
        100 => "Continue",
        101 => "Switching Protocols",
        102 => "Processing",
      
        200 => "OK",
        201 => "Created",
        202 => "Accepted",
        203 => "Non-Authoritative Information",
        204 => "No Content",
        205 => "Reset Content",
        206 => "Partial Content",
        207 => "Multi-Status",
        226 => "IM Used",
      
        300 => "Multiple Choices",
        301 => "Moved Permanently",
        302 => "Found",
        303 => "See Other",
        304 => "Not Modified",
        305 => "Use Proxy",
        307 => "Temporary Redirect",
      
        400 => "Bad Request",
        401 => "Unauthorized",
        402 => "Payment Required",
        403 => "Forbidden",
        404 => "Not Found",
        405 => "Method Not Allowed",
        406 => "Not Acceptable",
        407 => "Proxy Authentication Required",
        408 => "Request Timeout",
        409 => "Conflict",
        410 => "Gone",
        411 => "Length Required",
        412 => "Precondition Failed",
        413 => "Request Entity Too Large",
        414 => "Request-URI Too Long",
        415 => "Unsupported Media Type",
        416 => "Requested Range Not Satisfiable",
        417 => "Expectation Failed",
        422 => "Unprocessable Entity",
        423 => "Locked",
        424 => "Failed Dependency",
        426 => "Upgrade Required",
      
        500 => "Internal Server Error",
        501 => "Not Implemented",
        502 => "Bad Gateway",
        503 => "Service Unavailable",
        504 => "Gateway Timeout",
        505 => "HTTP Version Not Supported",
        507 => "Insufficient Storage",
        510 => "Not Extended"
      }
      
      attr_accessor :is_logging, :output_file_name
      
      def initialize wire_log_name, output_file, is_html_output=true
        @output_file_name = output_file
        is_logging = true
        @wire_log_name = wire_log_name
        @log_buffer = nil
        @is_html_output = is_html_output
      end
      
      def clear_log
        output_file = File.open(@output_file_name, "a+")
        output_file.truncate(0)
        output_file.close
      end
      
      def flush options={}
        output_file = File.open(@output_file_name, "a+")
        @log_buffer.rewind
        buffer = @log_buffer.read
        if @is_html_output
          oldbuffer = buffer.dup
          buffer = ""
          oldbuffer.each_char { |c|
            if c == '<'
              buffer << "&lt;"
            elsif c == '>'
              buffer << "&gt;"
            else
              buffer << c
            end
          }
        end
        if options.has_key? :css_class
          css_class = options[:css_class]
        else
          css_class = "#{@wire_log_name}"
        end
        output_file.puts("<div class=\"#{css_class}\"><pre>") if @is_html_output
        output_file.write(buffer)
        output_file.puts("\n</div></pre>") if @is_html_output
        output_file.close
        @log_buffer = nil
      end
      
      def log s
        timestamp
        raw_log "#{s}"
        flush
      end
      
      def log_response response, title=nil
        timestamp    
        raw_log(title.nil? ? "Response" : "Response: #{title}")
        raw_log "Status: #{response.code} #{STATUS_CODES[response.code]}"
        headers = response.headers
        unless headers.blank?
          raw_log "Headers:"
          headers.each { |k,v| raw_log "#{k}: #{v}" if k.downcase =~ /^content/ }
        end

        if response.body
          # the following is expensive so do only when needed
          if is_logging
            raw_log "Body:"
          end
          begin
            json_obj = JSON.load(response.body)
            raw_log JSON.pretty_generate json_obj
          rescue
            raw_log "#{response.body}"
          end
        end
        newline
        flush :css_class => "#{@wire_log_name}Response"
      end
      
      def newline
        raw_log "\n"
      end
      
      def log_buffer  
        # put in the css header if file doesn't exist
        unless File.size? @output_file_name 
          @output_file = File.open @output_file_name, "a"
          @output_file.puts '<link rel="stylesheet" type="text/css" href="wirelog.css" />'
          @output_file.puts ""
          @output_file.close
        end
        unless @log_buffer
          @log_buffer = StringIO.new
        end
        @log_buffer
      end
      
      def raw_log s
        @log_buffer = log_buffer
        @log_buffer.puts(s)
      end
      
      def timestamp
        raw_log(Time.new)
      end
    end
    
  end
  
end