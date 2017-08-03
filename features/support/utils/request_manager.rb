require 'rest-client'

# Request Manager class.
# Author: Pablo Ramirez, Daniel Montecinos.
module RequestManager
  def self.execute_request(http_request)
    if http_request.body.empty?
      return RestClient::Request.execute(method: http_request.method,
                                         url: http_request.url,
                                         headers: http_request.header)
    end

    RestClient::Request.execute(method: http_request.method,
                                url: http_request.url,
                                payload: http_request.body.to_json,
                                headers: http_request.header)
  end
end
