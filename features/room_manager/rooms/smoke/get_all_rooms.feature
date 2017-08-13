Feature: SMOKE - Get all rooms

  @delete_rooms
  Scenario: Get all rooms without query
    Given I make a 'GET' request to '/rooms'
    When I execute the request
    Then I expect a '200' status code
      And the JSON should be:
      """
      []
      """

  @delete_rooms
  Scenario: Get all rooms with status free
    Given I make a 'GET' request to '/rooms'
      And I set this queries:
        | from   | 2017-01-01T00:00:01.000Z |
        | to     | 2017-01-01T00:00:59.000Z |
        | status | free                     |
    When I execute the request
    Then I expect a '200' status code
      And the JSON should be:
      """
      []
      """

  @delete_rooms
  Scenario: Get all rooms with status busy
    Given I make a 'GET' request to '/rooms'
      And I set this queries:
        | from   | 2017-01-01T00:00:01.000Z |
        | to     | 2017-01-01T00:00:59.000Z |
        | status | busy                     |
    When I execute the request
    Then I expect a '200' status code
      And the JSON should be:
        """
        []
        """
