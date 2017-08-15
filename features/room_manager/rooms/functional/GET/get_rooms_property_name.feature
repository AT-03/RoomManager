# Author: Pablo Ramirez
@functional @negative
Feature: Get all rooms using additional property names

  Scenario: Retrieve all rooms using "new property" as property names
    Given I make a 'GET' request to '/rooms'
      And I set this queries:
        | $select | new property             |
        | from    | 2017-01-01T00:00:01.000Z |
        | to      | 2017-01-01T00:00:59.000Z |
        | status  | free                     |
    When I execute the request
    Then I expect a '400' status code
      And the JSON should be:
          """
          {
            "name":"InvalidFieldFound",
            "description":"Attribute field with value 'new property' does not exist."
          }
          """