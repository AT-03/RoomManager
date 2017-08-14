@functional
Feature: Get all rooms using incorrect data

  Scenario: Retrieve all rooms using an incorrect data in the To field
    Given I make a 'GET' request to '/rooms'
      And I set this queries:
        | $select | name                     |
        | from    | 2017-01-01T00:00:00.000Z |
        | to      | incorrect data           |
        | status  | free                     |
    When I execute the request
    Then I expect a '400' status code
      And the JSON should be:
            """
            {
              "name": "BadRequest",
              "description": "Invalid to param\n    StatusCode: 400"
            }
            """