@functional
Feature: Get all rooms using empty data

  Scenario: Retrieve all rooms using empty "from" data
    using status free
    Given I make a 'GET' request to '/rooms'
      And I set this queries:
        | $select | name                     |
        | from    |                          |
        | to      | 2017-01-01T00:00:59.000Z |
        | status  | free                     |
    When I execute the request
    Then I expect a '400' status code
      And the JSON should be:
          """
          {
            "name":"BadRequest",
            "description":"To get rooms in range of time, FROM, TO and STATUS params must be sent\n    StatusCode: 400"
          }
          """


  Scenario: Retrieve all rooms using empty "from" data
    using status busy
    Given I make a 'GET' request to '/rooms'
    And I set this queries:
      | $select | name                     |
      | from    |                          |
      | to      | 2017-01-01T00:00:59.000Z |
      | status  | busy                     |
    When I execute the request
    Then I expect a '400' status code
    And the JSON should be:
          """
          {
            "name":"BadRequest",
            "description":"To get rooms in range of time, FROM, TO and STATUS params must be sent\n    StatusCode: 400"
          }
          """