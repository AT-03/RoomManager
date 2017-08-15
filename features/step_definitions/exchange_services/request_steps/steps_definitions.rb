# Author: Daniel Cabero

require_relative '../../../../features/support/utils/http_request'
require_relative '../../../../features/support/utils/request_manager'
require_relative '../../../../features/support/utils/helper'

include RSpec::Matchers


And(/^I load headers exchanges$/) do
  @user = Env.user_mail
  @credential= Helper.encode_credentials(Env.user_password)
  @http.add_header_field('Exchange-Calendar',@user)
  @http.add_header_field('Exchange-Credentials', @credential)

end


And(/^the response should be:$/) do |json|

  # expect(@json).to include_json(json)
  # puts "#{expect(@json).to include_unordered_json (json)}"
  # hash_body = nil
  # expect { hash_body = JSON.parse(@json.body).with_indifferent_access }.not_to raise_exception
  # expect(hash_body).to match (json)
  result = JsonCompare.compare_elements(@json, json)
end

And(/^I load headers exchanges incorrect$/) do
  @http.add_header_field('Exchange-Calendar','')
  @http.add_header_field('Exchange-Credentials', '')
end

# Daniel Cabero
# this method is the get the credential and mail user(administrator) whitout jar code.
def value_header(value)
  value=='credentialId' ? value=Helper.encode_credentials(Env.password_code) : value=='mail_account'? Env.user_mail : value
end

And(/^I set this headers exchange:$/) do |headers|
  headers.rows_hash.each { |key, value|
    @http.add_header_field(key, value_header(value))}

end


And(/^a response body:$/) do |json|
  expect(json).to have_attributes(@json)

end