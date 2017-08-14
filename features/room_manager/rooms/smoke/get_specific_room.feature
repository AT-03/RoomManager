@smoke
Feature: SMOKE - Get a specific room

  Scenario: Get a specific room, obtaining the "id" of the data stored in the database
    Given I look 'room_four' from 'name' of the table 'rooms'
     And I make a 'GET' request to '/rooms/{roomsId}'
    When I execute the request
      And I store the response
      And after build a expected response with the fields:
        | _id         |
        | name        |
        | email       |
        | service     |
        | uuid        |
        | roomStatus  |
        | displayName |
        | __v         |
        | location    |
        | equipment   |
    Then I expect a '200' status code
      And the JSON at "_id" should be an string
      And the built response should be equal to the obtained response
