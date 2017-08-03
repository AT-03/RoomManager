# HttpRequest class.
# Author: Daniel Montecinos, Pablo Ramirez.
class HttpRequest
  attr_reader :header, :body, :method, :url

  def initialize(endpoint)
    @endpoint = endpoint
    @header = {}
    @body = {}
    @method = 'get'
  end

  def add_header_field(key, value)
    @header.store(key.downcase.to_sym, value)
  end

  def add_header_query(query = {})
    @header[:params] = query
  end

  def add_body(body)
    @body = body
  end

  def add_method(method)
    @method = method
  end

  def build_url
    es_url = 'http://localhost:3000/api/v1'
    rm_url = 'http://localhost:7070/api/v1'

    base_url = @header.key?('exchange-calendar'.to_sym) ? es_url : rm_url
    @url = "#{base_url}/#{@endpoint}"
  end
end
