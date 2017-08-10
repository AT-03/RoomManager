require 'json'
require_relative 'helper'
# require_relative '../../../../features/support/env'

# HttpRequest class.
# Author: Daniel Montecinos, Pablo Ramirez.
class HttpRequest
  attr_reader :header, :body, :method, :url

  def initialize(endpoint)
    user = Env.user_password
    credentials = Helper.encode_credentials(user)

    @endpoint = endpoint
    @header = {
        :'Content-Type' => 'application/json',
        Credentials: credentials
    }
    @body = {}
    @method = 'get'
  end

  # Daniel Montecinos
  # Use this method if you want to change the values set by default.
  def add_header_field(key, value)
    @header.delete_if {|k| key.end_with?(k.to_s) || key.equal?(k.to_s)}

    @header.store(key, value)
  end

  def add_header_query(query = {})
    @header[:params] = query
  end

  def add_body(body)
    @body = Helper.parse_to_json(body)
  end

  def add_method(method)
    @method = method
  end

  def build_url
    base_url = @header.key?('Exchange-Calendar') ? Env.exchanges : Env.room
    @url = "#{base_url}#{@endpoint}"
  end
end
