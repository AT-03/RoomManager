require_relative '../../../../features/support/utils/http_request'
require_relative '../../../../features/support/utils/request_manager'
require_relative '../../../../features/support/utils/helper'

include RSpec::Matchers

Given(/^I make a '(\w+)' request to '(.+)'$/) do |method, endpoint|
  @http = HttpRequest.new(Helper.build_endpoint(endpoint, @key, @json))
  @http.add_method(method)
end

And(/^I set this queries:$/) do |queries|
  @http.add_header_query(queries.rows_hash)
end

And(/^I set this headers:$/) do |headers|
  headers.rows_hash.each { |key, value| @http.add_header_field(key, value)}
end

When(/^I execute the request$/) do
  @http.build_url
  @json = RequestManager.execute_request(@http)
end

Then(/^I expect a '(\d+)' status code$/) do |status_code_expected|
  expect(@json.code).to eql(status_code_expected.to_i)
end

And(/^a response body as:$/) do |body_expected|
  expect(@json.body).to be_json_eql(body_expected).excluding('_id')
end

And(/^I set this body:$/) do |json|
  @http.add_body(json)
end

Then(/^I store the '(_?\w+)' as '(?:.+)'$/) do |key|
  @value = Helper.get_value(key, @json.body)
  @key = key
end

And(/^after build a expected response with the fields:$/) do |table|
  @built_response = {}
  table.transpose.column_names.each do |field|
    Helper.parse_to_json(@json.body).each do |key, value|
      @built_response.store(key, value) if key.eql?(field)
    end
  end
end

And(/^the built response should be equal to the obtained response$/) do
  expect(@built_response.to_json).to be_json_eql(@last_json.body)
end

And(/^I've loaded (.*)\.json$/) do |json_file|
  @json_body = File.read("resources/rm_meetings/#{json_file}")
end

And(/^I've used the file to set the body request$/) do
  @http.add_body(@json_body)
end

And(/^the meeting should be updated$/) do
  expect(@last_json).to_not be_json_eql(@json)
end

Given(/^I look '([^\n]+)' from '(\w+)' of the table '(\w+)'$/) do |value, key, endpoint|
  @bson = @db_rm.find_element(endpoint, key, value)
  @json = Helper.get_value('_id', @bson.to_json).to_json
  @key = '$oid'
end

And(/^I store the response$/) do
  @last_json = @json
end

And(/^the JSON response should( not)? include the field "(\w+)"$/) do |field, negative|
  answer = Helper.parse_to_json(@json.body).key?(field)

  not answer if negative
end

And(/^the '(_\w+)' value of the response body should remain unchanged$/) do |key|
  expect(Helper.get_value(key, @json.body)).to eql(@value)
end