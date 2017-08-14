@functional
Feature: POST a new service with invalid username

  @delete_services
  Scenario: Create a new service using invalid username
    Given I make a 'POST' request to '/services'
      And I set this body:
            """
            {
              "hostname": "server2012dc.ArabITPro.local",
              "username": "Incorrect",
              "password": "P@ssw0rd",
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
