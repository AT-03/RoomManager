require 'singleton'

class Connection
  include Singleton
  attr_reader :base_uri, :header

  def initialize
    @base_uri = 'http://localhost:3000/api/v1'
    @header = {:'Content-Type' => 'application/json',
               :'Credentials' => 'QWRtaW5pc3RyYXRvcjpQQHNzdzByZA==',
               :'Accept' => 'application/json'}
  end
end
