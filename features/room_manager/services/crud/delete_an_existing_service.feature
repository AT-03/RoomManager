@crud
Feature: DELETE an existing service

  Background: Create a service
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
    Then I store the '_id' as '{serviceId}'

  @delete_services
  Scenario: Delete a service created using the retrieved id

    Given I make a 'DELETE' request to '/services/{serviceId}'
    When I execute the request
    Then I expect a '200' status code
      And the JSON response should not include the field "_id"
