@functional
Feature: POST a new service with a number greater than to 480

  @delete_services
  Scenario: : Create a new service using a number greater than to 480
    Given I make a 'POST' request to '/services'
      And I set this body:
            """
            {
              "hostname": "server2012dc.ArabITPro.local",
              "username": "Administrator",
              "password": "P@ssw0rd",
              "deleteLockTime": 500
            }
            """
    When I execute the request
    Then I expect a '400' status code
      And the JSON should be:
            """
            {
              "name": "ValidationError",
              "description": "data.deleteLockTime should be <= 480"
            }
            """
