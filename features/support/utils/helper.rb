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
    Base64.encode64(credentials)
  end
end
