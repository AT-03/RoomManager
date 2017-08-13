# Author: Pablo Ramirez
# Connection Database
# Create Subscriptions
Before do
  host_port = Env.host_port_db
  method = 'post'
  data_base_es = Env.data_base_es
  data_base_rm = Env.data_base_rm

  @db_es = Mongodb.new(host_port, data_base_es)
  @db_rm = Mongodb.new(host_port, data_base_rm)

  @db_es.drop_database
  @db_rm.drop_database

  create_subscriptions(method)

  create_service(method)
end

def build_request(body, endpoint, method)
  @http = HttpRequest.new("/#{endpoint}")
  @http.add_body(body.to_json)
  @http.add_method method
end

# Delete all meetings
Before('@delete_meetings') do
  @db_es.drop 'meetings'
  @db_rm.drop 'meetings'
end

# Delete services
Before('@delete_services') do
  @db_es.drop 'services'
  @db_rm.drop 'services'
end

# Delete rooms
Before('@delete_rooms') do
  @db_rm.drop 'rooms'
end

# Close Database
After do
  @db_es.close_connection
  @db_rm.close_connection
end

def create_service(method)
  value_service = 'hostname'
  endpoint = 'services'
  response = @db_es.find_element endpoint, value_service, Env.hostname

  if response.to_h.empty?
    build_request(Env.body_services, endpoint, method)
    @http.build_url
    RequestManager.execute_request @http
    Helper.timer Env.timer
  end
end

def create_subscriptions(method)
  value_subscriptions = 'host'
  response = @db_rm.find_element(Env.endpoint_subscriptions,
                                 value_subscriptions,
                                 Env.host_subscriptions)
  if response.to_h.empty?
    build_request Env.body_subscriptions, Env.endpoint_subscriptions, method
    @http.add_header_field(Env.key_header_subs, Env.value_header_subs)
    @http.build_url
    RequestManager.execute_request @http
  end
end
