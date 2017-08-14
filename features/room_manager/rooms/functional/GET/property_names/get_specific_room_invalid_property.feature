@functional
Feature: SMOKE - Get a specific room

  Scenario: Retrieve a specific room using "new property" as property names
    Given I look 'room_four' from 'name' of the table 'rooms'
      And I make a 'GET' request to '/rooms'
      And I set this queries:
        | $select | new property |
    When I execute the request
    Then I expect a '400' status code
      And the JSON should be:
              """
              {
                "name":"InvalidFieldFound",
                "description":"Attribute field with value 'new property' does not exist."
              }
              """