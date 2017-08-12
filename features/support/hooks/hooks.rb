# Author: Pablo Ramirez
# Connection Database
# Create Subscriptions
Before do
  host_port = Env.host_port_db
  value = 'host'
  method = 'post'
  endpoint = Env.endpoint_subscriptions
  data_base_es = Env.data_base_es
  data_base_rm = Env.data_base_rm
  @db_es = Mongodb.new(host_port, data_base_es)
  @db_rm = Mongodb.new(host_port, data_base_rm)

  @db_es.drop_database
  @db_rm.drop_database

  response = @db_rm.find_element(endpoint, value, Env.host_subscriptions)
  if response.to_h.empty?
    build_request Env.body_subscriptions, endpoint, method
    @http.add_header_field(Env.key_header_subs, Env.value_header_subs)
    @http.build_url
    RequestManager.execute_request @http
  end
end

# Create a service
Before('@createService') do
  value = 'hostname'
  method = 'post'
  endpoint = 'services'

  response = @db_es.find_element endpoint, value, Env.hostname

  if response.to_h.empty?
    build_request(Env.body_services, endpoint, method)
    @http.build_url
    RequestManager.execute_request @http
    Helper.timer 1
  end
end

def build_request(body, endpoint, method)
  @http = HttpRequest.new("/#{endpoint}")
  @http.add_body(body.to_json)
  @http.add_method method
end

# Delete all meetings
Before('@deleteMeetings') do
  @db_es.drop 'meetings'
  @db_rm.drop 'meetings'
end

# Delete services
Before('@deleteServices') do
  @db_es.drop 'services'
  @db_rm.drop 'services'
end

# Delete rooms
Before('@deleteRooms') do
  @db_rm.drop 'rooms'
end

# Close Database
After do
  @db_es.close_connection
  @db_rm.close_connection
end
