@functional
Feature: POST a service with an integer username as value

  Scenario: : Create a service with an integer username as value
    Given I make a 'POST' request to '/services'
      And I set this body:
          """
          {
            "hostname": "server2012dc.ArabITPro.local",
            "username": 2017,
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
              "description":"data.username should be string"
            }
            """
