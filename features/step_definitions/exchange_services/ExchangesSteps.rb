require_relative '../../../request_manager'
require 'json'
require_relative '../../../helper'

# test configuration travis
$request= RequestManager

When(/^I GET request of services$/) do
  p response = $request.get('/services')
  p response.to_json
end


When(/^I POST request of services:$/) do |table|
  # table is a table.hashes.keys # => [:subjects, :body, :start, :end, :location]
  puts table
  # puts table.to_json
  puts  data=table.rows_hash
  # response = $request.post '/meetings',data
  #  p response
end