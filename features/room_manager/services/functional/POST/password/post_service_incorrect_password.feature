@functional
Feature: POST a new service with invalid password

  @delete_services
  Scenario: : Create a new service using invalid password
    Given I make a 'POST' request to '/services'
      And I set this body:
            """
            {
              "hostname": "server2012dc.ArabITPro.local",
              "username": "Administrator",
              "password": "Incorrect",
              "deleteLockTime": 10
            }
            """
    When I execute the request
    Then I expect a '400' status code
      And the JSON should be:
            """
            {
              "name": "InvalidCredentialsError",
              "description": "The credentials entered are not correct"
            }
            """
