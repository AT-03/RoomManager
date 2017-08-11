# Author: Pablo Ramirez
# Connection data base
Before do
  host_port = Env.host_port_db
  data_base_es = Env.data_base_es
  data_base_rm = Env.data_base_rm
  @db_es = Mongodb.new(host_port, data_base_es)
  @db_rm = Mongodb.new(host_port, data_base_rm)
end

# Close connection
After do
  @db_es.close_connection
  @db_rm.close_connection
end

# Post subscriptions
Before do
  value = 'host'
  method = 'post'
  endpoint = Env.endpoint_subscriptions

  response = @db_es.find_element(endpoint, value, Env.host_subscriptions)
  if response.to_h.empty?
    method_name Env.body_subscriptions, endpoint, method
    @http.add_header_field(Env.key_header_subs, Env.value_header_subs)
    @http.build_url
    RequestManager.execute_request @http
  end
end

# Create a service
Before do
  value = 'domain'
  method = 'post'
  endpoint = 'services'

  response = @db_es.find_element endpoint, value, Env.hostname
  Helper.time_sleep

  if response.to_h.empty?
    method_name(Env.body_services, endpoint, method)
    @http.build_url
    RequestManager.execute_request @http
    Helper.time_sleep
  end
end

# Delete all meetings
Before do
  @db_es.drop 'meetings'
  @db_rm.drop 'meetings'
end

# Delete services
After('@deleteServices') do
  @db_es.drop 'services'
  @db_rm.drop 'services'
end

def method_name(body, endpoint, method)
  @http = HttpRequest.new("/#{endpoint}")
  @http.add_body(body.to_json)
  @http.add_method method
end
