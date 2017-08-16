# Author: Pablo Ramirez
@functional @negative
Feature: POST a service with a hostname field

  @delete_services
  Scenario Outline: Create a service with a hostname field
    Given I make a 'POST' request to '/services'
      And I set this body:
          """
          {
            "hostname": <hostname>,
            "username": "Env.user",
            "password": "Env.password",
            "deleteLockTime": 11
          }
          """
      And I replace the values of the body request
    When I execute the request
    Then I expect a '<status>' status code
      And the JSON should be:
            """
            {
              "name":"<response_name>",
              "description":"<response_description>"
            }
            """
    Examples:
      | hostname                       | status | response_name             | response_description                                                                                              |
      | "server2012dc.ArabITPro.local" | 400    | InvalidCredentialsError   | The credentials entered are not correct                                                                           |
      | ""                             | 400    | ValidationError           | data.hostname should NOT be shorter than 1 characters                                                             |
      | 2017                           | 400    | ValidationError           | data.hostname should be string                                                                                    |
      | "incorrect"                    | 409    | RequestNetBIOSDomainError | Can't connect to LDAP server, please ensure the NetBIOS domain is correct and your computer belongs to the domain |
