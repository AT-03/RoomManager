@crud
Feature: PUT an existing service an incorrect username

  Background: Create a service
    Given I make a 'POST' request to '/services'
      And I set this body:
              """
              {
                "hostname": "server2012dc.ArabITPro.local",
                "username": "Administrator",
                "password": "P@ssw0rd",
                "deleteLockTime": 10
              }
              """
    When I execute the request
      And I store the '_id' as '{serviceId}'

  @delete_services
  Scenario: Update a service created using an incorrect username
    Given I make a 'PUT' request to '/services/{serviceId}'
      And I set this body:
            """
            {
              "username": "incorrect",
              "password": "P@ssw0rd",
              "deleteLockTime": 15
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
