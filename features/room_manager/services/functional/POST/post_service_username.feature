# Author: Pablo Ramirez
@functional @negative
Feature: POST a new service with username field

  @delete_services
  Scenario Outline: Create a new service using username field
    Given I make a 'POST' request to '/services'
      And I set this body:
            """
            {
              "hostname": "Env.hostname",
              "username": <username>,
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
      | status | username                                                                                                                                                                                                                                                                                                                           | response_name             | response_description                                                                                              |
      | 400    | ""                                                                                                                                                                                                                                                                                                                                 | ValidationError           | data.username should NOT be shorter than 1 characters                                                             |
      | 409    | "Incorrect"                                                                                                                                                                                                                                                                                                                        | RequestNetBIOSDomainError | Can't connect to LDAP server, please ensure the NetBIOS domain is correct and your computer belongs to the domain |
      | 409    | "Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_" | RequestNetBIOSDomainError | Can't connect to LDAP server, please ensure the NetBIOS domain is correct and your computer belongs to the domain |
      | 400    | 2017                                                                                                                                                                                                                                                                                                                               | ValidationError           | data.username should be string                                                                                    |
