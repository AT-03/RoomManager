@functional
Feature: PUT an existing service with a incorrect id

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
      And I store the 'id' as '{invalidId}'

  @delete_services
  Scenario: Update a service created using a incorrect id
    Given I make a 'PUT' request to '/services/{invalidId}'
      And I set this body:
              """
              {
                "username": "Administrator",
                "password": "P@ssw0rd",
                "deleteLockTime": 15
              }
              """
    When I execute the request
    Then I expect a '404' status code
      And the JSON response should include the field "name"
      And the JSON response at "name" should include "NotFound"

