# Author: Daniel Cabero
@smoke
Feature: SMOKE, GET request to all exchanges meetings

  Scenario: Retrieve all the created  exchanges meetings
    Given I make a 'GET' request to '/meetings'
    And I set this queries:
      | start | 2019-09-01T00:00:00.000Z |
      | end   | 2019-09-31T23:59:59.000Z |
    And I set this headers exchange:
      | Content-type         | application/json |
      | Exchange-Credentials | credentialId     |
      | Exchange-Calendar    | mail_account     |
    When I execute the request
    Then I expect a '200' status code
    And the JSON should be:
        """
          []
        """
