@functional
Feature: Get all rooms using empty data

  Scenario: Retrieve all rooms using empty "to" data
    Given I make a 'GET' request to '/rooms'
      And I set this queries:
        | $select | name                     |
        | from    | 2017-01-01T00:00:00.000Z |
        | to      | 2017-01-01T00:00:59.000Z |
        | status  |                          |
    When I execute the request
    Then I expect a '400' status code
      And the JSON should be:
            """
            {
              "name": "BadRequest",
              "description": "Invalid from param\n    StatusCode: 400"
            }
            """