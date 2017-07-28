require_relative 'request_manager'
require_relative 'helper'

# puts Helper.pretty_json(RequestManager.get('/rooms?owner=Administrator%40arabitpro.local&start=2017-01-21T20%3A00%3A00.000Z&end=2017-12-21T20%3A30%3A00.000Z'))

hash = {owner: 'Administrator@arabitpro.local',
        start: '2017-01-21T20:00:00.000Z',
        end: '2017-12-21T20:30:00.000Z'}

# puts Helper.pretty_json(RestClient.get(
#     'http://localhost:7070/api/v1/meetings',
#     params: hash,
#     :'Credentials' => 'QWRtaW5pc3RyYXRvcjpQQHNzdzByZA=='
# ))

response = RequestManager.get('/meetings', hash)
puts Helper.pretty_json(response)

# response = RequestManager.post('/meetings',
#                                {
#                                    :"organizer" => "administrator@arabitpro.local",
#                                    :"subject" => "Whatever you want 2",
#                                    :"body"=> "Framework Test",
#                                    :"start"=> "2017-07-27T14:46:10.968Z",
#                                    :"end"=> "2017-07-28T14:46:10.968Z",
#                                    :"rooms"=> [
#                                        "RM@arabitpro.local"
#                                    ],
#                                    :"attendees"=> [
#                                    ],
#                                    :"optionalAttendees"=> [
#                                    ]
#                                }
# )
#
# puts Helper.pretty_json(response)

# response = RequestManager.post('/services',
#                                {
#
#                                    :"hostname" => "server2012dc.ArabITPro.local",
#                                    :"username" => "Administrator",
#                                    :"password" => "P@ssw0rd"
#
#                                })
# puts Helper.pretty_json(response)
#
# # response = RequestManager.put('/services' + "/#{Helper.get_json_value(response, '_id')}",
# #                               {
# #                                   :"username" => "Administrator",
# #                                   :"password" => "ABC123}"
# #
# #                               })
# # puts Helper.pretty_json(response)
#
# puts Helper.pretty_json(RequestManager.get('/services'))
#
# response = RequestManager.delete('/services' + "/#{Helper.get_json_value(response, '_id')}")
# puts response.code
#
# puts Helper.pretty_json(RequestManager.get('/services'))
