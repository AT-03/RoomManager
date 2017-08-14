@functional
  Feature: PUT an existing service with a empty id

  Scenario: Update a service created using a incorrect id
    Given I make a 'PUT' request to '/services/'
      And I set this body:
              """
              {
                "username": "Administrator",
                "password": "P@ssw0rd",
                "deleteLockTime": 15
              }
            """
    When I execute the request
    Then I expect a '404' status code
#      And the JSON should be:
#              """
#              {
#                "name": "InvalidCredentialsError",
#                "description": "The credentials entered are not correct"
#              }
#              """

