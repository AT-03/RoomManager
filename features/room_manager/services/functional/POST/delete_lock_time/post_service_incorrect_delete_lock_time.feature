@functional
Feature: POST a new service with a incorrect deleteLockTime

  @delete_services
  Scenario: : Create a new service using a incorrect deleteLockTime
    Given I make a 'POST' request to '/services'
      And I set this body:
            """
            {
              "hostname": "server2012dc.ArabITPro.local",
              "username": "Administrator",
              "password": "P@ssw0rd",
              "deleteLockTime": incorrect
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
