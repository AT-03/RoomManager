@functional
Feature: PUT an existing service an greater than 480 deleteLockTime

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
  Scenario: Update a service created using an greater than 480 deleteLockTime
    Given I make a 'PUT' request to '/services/{serviceId}'
      And I set this body:
              """
              {
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
