# Author: Pablo Ramirez
@functional @negative
Feature: PUT an existing service an empty username

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
  Scenario Outline: Update a service created using an empty username
    Given I make a 'PUT' request to '/services/{serviceId}'
    And I set this body:
            """
            {
              "username": <username>,
              "password": "P@ssw0rd",
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
      | username    | response_name           | response_description                                  |
      | ""          | ValidationError         | data.username should NOT be shorter than 1 characters |
      | "Incorrect" | InvalidCredentialsError | The credentials entered are not correct               |
      | 2017        | ValidationError         | data.username should be string                        |
