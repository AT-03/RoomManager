Feature: SMOKE, GET request to all meetings

  Scenario: Retrieve all the created meetings
    Given I make a 'GET' request to '/meetings'
      And I set this queries:
        | owner | administrator@arabitpro.local |
        | start | 2019-03-01T00:00:00.000Z      |
        | end   | 2019-03-31T23:59:59.000Z      |
    When I execute the request
    Then I expect a '200' status code
      And the JSON should be:
      """
        []
      """
     