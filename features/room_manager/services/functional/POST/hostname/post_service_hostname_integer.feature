@functional
Feature: POST a service with an integer hostname as value

  Scenario: : Create a service with an integer hostname as value
    Given I make a 'POST' request to '/services'
      And I set this body:
            """
            {
              "hostname": 2017,
              "username": "Administrator",
              "password": "P@ssw0rd",
              "deleteLockTime": 11
            }
            """
    When I execute the request
    Then I expect a '400' status code
      And the JSON should be:
            """
            {
              "name":"ValidationError",
              "description":"data.hostname should be string"
            }
            """
