require 'json'
require 'base64'

# Helper class.
# Author: Daniel Montecinos, Pablo Ramirez.
class Helper
  def self.pretty_json(json_string)
    JSON.pretty_generate(JSON[json_string])
  end

  def self.get_json_value(json, key)
    JSON.parse(json).fetch(key)
  end

  def self.encode_credentials(credentials)
    Base64.encode64("#{credentials}")
  end

  # Daniel Montecinos
  def self.build_endpoint(endpoint, key = '', response = {})
    if endpoint.include?('{')
      condition = eval(response.body).key?(key.to_sym)
      value = condition ? eval(response.body)[key.to_sym] : ''

      return endpoint.gsub(/\{\w+\}/, value)
    end
    endpoint
  end

  # Daniel Montecinos
  def self.get_value(key, response_body)
    eval(response_body)[key.to_sym]
  end
end
