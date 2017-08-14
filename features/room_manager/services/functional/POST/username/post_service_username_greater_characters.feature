@functional
Feature: POST a service with a username greater than 256 characters

  @delete_services
  Scenario: : Create a service with a username greater than 256 characters
    Given I make a 'POST' request to '/services'
      And I set this body:
              """
              {
                "hostname": "server2012dc.ArabITPro.local",
                "username": "Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_Incorrect_value_",
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
