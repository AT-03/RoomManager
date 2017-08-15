# Author: Pablo Ramirez
@functional @negative
Feature: PUT an existing service with deleteLockTime field

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
  Scenario Outline: Update a service created using deleteLockTime field
    Given I make a 'PUT' request to '/services/{serviceId}'
    And I set this body:
              """
              {
                "username": "Administrator",
                "password": "P@ssw0rd",
                "deleteLockTime": <delete_lock_time>
              }
            """
    When I execute the request
    Then I expect a '400' status code
    And the JSON should be:
              """
              {
                "name": "<response_name>",
                "description": "<response_description>"
              }
              """
    Examples:
      | delete_lock_time | response_name   | response_description                  |
      | 10.5             | ValidationError | data.deleteLockTime should be integer |
      | 500              | ValidationError | data.deleteLockTime should be <= 480  |
      | -500             | ValidationError | data.deleteLockTime should be >= 0    |
      | ""               | ValidationError | data.deleteLockTime should be integer |

