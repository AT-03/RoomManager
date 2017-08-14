@functional
Feature: POST a new service with empty username

  Scenario: : Create a new service using empty username
    Given I make a 'POST' request to '/services'
      And I set this body:
            """
            {
              "hostname": "",
              "username": "Administrator",
              "password": "P@ssw0rd",
              "deleteLockTime": 10
            }
            """
    When I execute the request
    Then I expect a '400' status code
      And the JSON should be:
              """
              {
                "name":"ValidationError",
                "description":"data.hostname should NOT be shorter than 1 characters"
              }
              """
