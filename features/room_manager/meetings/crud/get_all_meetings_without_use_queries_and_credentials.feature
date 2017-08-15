# Author: Daniel Montecinos

@crud
Feature: CRUD

  Scenario: Retrieve all the created meetings
    Given I make a 'GET' request to '/meetings'
      And I change the "value" of "Credentials" to ""
    When I execute the request
    Then I expect a '200' status code
      And the JSON should be:
      """
        []
      """
     