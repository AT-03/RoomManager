@functional
Feature: POST a new service with empty deleteLockTime

  Scenario: : Create a new service using empty deleteLockTime
    Given I make a 'POST' request to '/services'
      And I set this body:
            """
            {
              "hostname": "server2012dc.ArabITPro.local",
              "username": "dsadas",
              "password": "P@ssw0rd",
              "deleteLockTime":
            }
            """
    When I execute the request
    Then I expect a '400' status code
      And the JSON should be:
              """
              {
                "name":"ValidationError",
                "description":"data.deleteLockTime should NOT be shorter than 1 characters"
              }
              """
