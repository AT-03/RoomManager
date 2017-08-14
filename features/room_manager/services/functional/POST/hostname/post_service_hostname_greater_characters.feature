@functional
Feature: POST a service with a hostname greater than 256 characters

  Scenario: : Create a service with a hostname greater than 256 characters
    Given I make a 'POST' request to '/services'
      And I set this body:
              """
              {
                "hostname": "Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_",
                "username": "Administrator",
                "password": "P@ssw0rd",
                "deleteLockTime": 11
              }
              """
    When I execute the request
    Then I expect a '400' status code
      And the JSON should be:
              """
              {
                "name":"InvalidCredentialsError",
                "description":"The credentials entered are not correct"
              }
              """
