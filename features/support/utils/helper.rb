require 'json'

class Helper
  def self.pretty_json(json_string)
    JSON.pretty_generate(JSON[json_string])
  end

  def self.get_json_value(json, key)
    JSON.parse(json).fetch(key)
  end
end
