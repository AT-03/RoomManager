@functional
Feature: POST a new service with empty password

  Scenario: : Create a new service using empty password
    Given I make a 'POST' request to '/services'
      And I set this body:
            """
            {
              "hostname": "server2012dc.ArabITPro.local",
              "username": "Administrator",
              "password": "",
              "deleteLockTime": 10
            }
            """
    When I execute the request
    Then I expect a '400' status code
      And the JSON should be:
              """
              {
                "name":"ValidationError",
                "description":"data.password should NOT be shorter than 1 characters"
              }
              """
