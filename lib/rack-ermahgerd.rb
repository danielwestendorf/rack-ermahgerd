require "rack-ermahgerd/version"
require 'nokogiri'

module Rack
  class Ermahgerd
    def initialize(app, options={})
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)

      response_body = ""
      response.each {|part| response_body << translate(part)}
      headers["Content-Length"] = Rack::Utils.bytesize(response_body.to_s).to_s

      [status, headers, response_body]
    end

    def translate(html)
      doc = Nokogiri::HTML(html)
      doc.traverse do |x|
        if x.text?
          x.content = ermahgerd_it(x.content)
        end
      end
      doc.to_s
    end

    def ermahgerd_it(text)
      text.upcase!
      text.gsub!(/[AEIOUY]r(?! )/i, 'E');
      text.gsub!(/AA/i, 'A');
      text.gsub!(/EE/i, 'E');
      text.gsub!(/II/i, 'I');
      text.gsub!(/OO/i, 'O');
      text.gsub!(/UU/i, 'U');
      text.gsub!(/YY/i, 'Y');
      text.gsub!(/[AEIOUY]{2,}/i, 'E');
      text.gsub!(/[AEIOUY](?! )/i, 'ER');
      text.gsub!(/[Y]/i, 'ER');
      text.gsub!(/ERH/i, 'ER');
      text.gsub!(/ERR/i, 'ER');
      text.gsub!(/MER/i, 'MAH');
      text.gsub!('ERWERSERMAH', 'ERSUM');
      text.gsub!('ERWERSERME', 'ERSUM');
      text.gsub!('GERSERBERMPS', 'GERSBERMS');
      text.gsub!('MAHMAH', 'MERM');
      text.gsub!('MAHME', 'MERM');
      text
    end
  end
end
