@functional
Feature: Get all rooms using incorrect data

  Scenario: Retrieve all rooms using an incorrect data in the From field
    Given I make a 'GET' request to '/rooms'
      And I set this queries:
        | $select | name                     |
        | from    | incorrect data           |
        | to      | 2017-01-01T00:00:59.000Z |
        | status  | free                     |
    When I execute the request
    Then I expect a '400' status code
      And the JSON should be:
            """
            {
              "name": "NotFound",
              "description": "From with value 'incorrect data' does not exist."
            }
            """