# Author: Pablo Ramirez
@functional @negative
Feature: PUT an existing service a password field

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
  Scenario Outline: Update a service created using a password field
    Given I make a 'PUT' request to '/services/{serviceId}'
    And I set this body:
            """
            {
              "username": "Administrator",
              "password": <password>,
              "deleteLockTime": 15
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
      | password    | response_name           | response_description                                  |
      | ""          | ValidationError         | data.password should NOT be shorter than 1 characters |
      | "incorrect" | InvalidCredentialsError | The credentials entered are not correct               |
      | 2017        | ValidationError         | data.password should be string                        |
