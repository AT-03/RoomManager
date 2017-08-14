@functional
Feature: POST a new service with a float number

  @delete_services
  Scenario: : Create a new service using a float number
    Given I make a 'POST' request to '/services'
      And I set this body:
            """
            {
              "hostname": "server2012dc.ArabITPro.local",
              "username": "Administrator",
              "password": "P@ssw0rd",
              "deleteLockTime": 10.5
            }
            """
    When I execute the request
    Then I expect a '400' status code
      And the JSON should be:
            """
            {
              "name": "ValidationError",
              "description": "data.deleteLockTime should be integer"
            }
            """
