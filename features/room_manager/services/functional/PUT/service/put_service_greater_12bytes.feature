@functional
Feature: PUT an existing service with a id greater than 12 bytes

  Scenario: Update a service created using a id greater than 12 bytes
    Given I make a 'PUT' request to '/services/c4f1b5c31b964cee796dca7c48e4'
      And I set this body:
              """
              {
                "username": "Administrator",
                "password": "P@ssw0rd",
                "deleteLockTime": 15
              }
            """
    When I execute the request
    Then I expect a '400' status code
      And the JSON should be:
              """
              {
                "name": "BadRequest",
                "description": "ServiceId argument passed in must be a String of 12 bytes or a string of 24 hex characters."
              }
              """

