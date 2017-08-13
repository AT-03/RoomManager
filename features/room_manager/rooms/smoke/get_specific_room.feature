Feature: SMOKE - Get a specific room

  Scenario: Get all rooms without query
    Given I look 'room_four' from 'name' of the table 'rooms'
      And I make a 'GET' request to '/rooms/{roomsId}'
    When I execute the request
    Then I expect a '200' status code
      And the JSON at "name" should be "room_four"
      And the JSON at "email" should be "RMFOUR@arabitpro.local"
