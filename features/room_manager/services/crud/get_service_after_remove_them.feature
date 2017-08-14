@crud
Feature: GET all services after remove them

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
      And I execute the request
      And I store the '_id' as '{serviceId}'
    When I make a 'DELETE' request to '/services/{serviceId}'
      And I execute the request

  @delete_services
  Scenario: Retrieve all the created services
    Given I make a 'GET' request to '/services'
    When I execute the request
    Then I expect a '200' status code
      And the JSON should be:
          """
          []
          """