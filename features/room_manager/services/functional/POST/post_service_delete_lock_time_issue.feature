# Author: Pablo Ramirez
@functional @negative @issue
Feature: POST a new service with deleteLockTime field

  Scenario Outline: Create a new service using deleteLockTime field
    Given I make a 'POST' request to '/services'
    And I set this body:
              """
              {
                "hostname": "server2012dc.ArabITPro.local",
                "username": "Administrator",
                "password": "P@ssw0rd",
                "deleteLockTime": <delete_Lock_Time>
              }
              """
    When I execute the request
    Then I expect a '400' status code
    And the JSON should be:
                """
                {
                  "name":"<response_name>",
                  "description":"<response_description>"
                }
                """
    Examples:
      | delete_Lock_Time | response_name           | response_description                                        |
      |                  | ValidationError         | data.deleteLockTime should NOT be shorter than 1 characters |
      | incorrect        | InvalidCredentialsError | The credentials entered are not correct                     |
