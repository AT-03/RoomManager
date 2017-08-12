require 'json'
require 'base64'

# Helper class.
# Author: Daniel Montecinos, Pablo Ramirez.
class Helper
  def self.pretty_json(json_string)
    JSON.pretty_generate(JSON[json_string])
  end

  def self.get_json_value(json, key)
    parse_to_json(json).fetch(key)
  end

  def self.encode_credentials(user)
    Base64.encode64(user)
  end

  # Daniel Montecinos
  def self.build_endpoint(endpoint, key = '', response = {})
    if endpoint.include?('{')
      parsed_response = parse_to_json(response)

      value = parsed_response.key?(key) ? parsed_response[key] : ''

      return endpoint.gsub(/\{\w+\}/, value)
    end
    endpoint
  end

  # Daniel Montecinos
  def self.get_value(key, response_body)
    parse_to_json(response_body)[key]
  end

  # Daniel Montecinos
  def self.parse_to_json(object)
    JSON.parse(object)
  end

  def self.timer(timeout)
    sleep timeout
  end
end
