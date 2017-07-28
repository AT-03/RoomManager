require 'rest-client'

require_relative 'connection'

class RequestManager

  URL = Connection.instance.base_uri
  HEADER = Connection.instance.header

  SYMBOL = 'Exchange-Credentials'

  STRING = 'QWRtaW5pc3RyYXRvcjpQQHNzdzByZA=='

  def self.get(endpoint, query = {})
    RestClient.get("#{URL}#{endpoint}", params: query, SYMBOL => STRING)
  end

  def self.post(endpoint, body)
    RestClient.post("#{URL}#{endpoint}", body.to_json, HEADER)
  end

  def self.put(endpoint, body)
    RestClient.put("#{URL}#{endpoint}", body.to_json, HEADER)
  end

  def self.delete(endpoint)
    RestClient.delete("#{URL}#{endpoint}", HEADER)
  end
end
