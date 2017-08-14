@functional
Feature: POST a service with an existing hostname

  Scenario: : Create a service with an existing hostname
    Given I make a 'POST' request to '/services'
      And I set this body:
          """
          {
            "hostname": "server2012dc.ArabITPro.local",
            "username": "Administrator",
            "password": "P@ssw0rd",
            "deleteLockTime": 11
          }
          """
    When I execute the request
    Then I expect a '409' status code
      And the JSON should be:
          """
          {
            "name":"Conflict value",
            "description":"Conflict with a domain with same name, the domain needs to be unique."
          }
          """
