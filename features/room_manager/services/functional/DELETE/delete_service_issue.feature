# Author: Pablo Ramirez
@functional @negative @issue
Feature: DELETE an existing service with id field

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
  Scenario Outline: Delete a service created using id field
    Given I make a 'DELETE' request to '/services/<id>'
    When I execute the request
    Then I expect a '<status>' status code
      And the JSON should be:
          """
          {
            "name": "<response_name>",
            "description": "<response_description>"
          }
          """
    Examples:
      | id          | status | response_name | response_description |
      |             | 404    | NotFound      |                      |
      | {serviceId} | 204    | No Content    |                      |
