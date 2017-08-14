@functional
Feature: POST a new service with string deleteLockTime value

  Scenario: : Create a new service using string deleteLockTime value
    Given I make a 'POST' request to '/services'
      And I set this body:
              """
              {
                "hostname": "server2012dc.ArabITPro.local",
                "username": "dsadas",
                "password": "P@ssw0rd",
                "deleteLockTime": ""
              }
              """
    When I execute the request
    Then I expect a '400' status code
      And the JSON should be:
                """
                {
                  "name":"ValidationError",
                  "description":"data.deleteLockTime should be integer"
                }
                """
