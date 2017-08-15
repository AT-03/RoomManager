# Author: Pablo Ramirez
@functional @negative
Feature: Get all rooms using field status

  Scenario Outline: Retrieve all rooms using field status
    Given I make a 'GET' request to '/rooms'
    And I set this queries:
      | $select | name                     |
      | from    | 2017-01-01T00:00:00.000Z |
      | to      | 2017-01-01T00:00:59.000Z |
      | status  | <status>                 |
    When I execute the request
    Then I expect a '400' status code
    And the JSON should be:
            """
            {
              "name": "<response_name>",
              "description": "<response_description>\n    <status_code>"
            }
            """
    Examples:
      | status         | response_name | response_description                                                   | status_code     |
      |                | BadRequest    | To get rooms in range of time, FROM, TO and STATUS params must be sent | StatusCode: 400 |
      | incorrect data | BadRequest    | Invalid status param                                                   | StatusCode: 400 |