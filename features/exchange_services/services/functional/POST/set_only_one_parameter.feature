#Author: Juan Aitken
@functional @negative
Feature: POST request to 'services' service setting only one parameter on the body

Scenario: POST request only setting a valid 'hostname'

  Given I make a 'POST' request to '/services'
    And I set this body:
          """
           {
             "hostname": "Env.hostname"

           }
          """
    And I replace the values of the body request
  When I execute the request
  Then I expect a '400' status code


Scenario: POST request only setting a valid 'username'

  Given I make a 'POST' request to '/services'
    And I set this body:
            """
             {
               "username": "Env.user"

             }
            """
    And I replace the values of the body request
  When I execute the request
  Then I expect a '400' status code


Scenario: POST request only setting a valid 'password'

  Given I make a 'POST' request to '/services'
    And I set this body:
           """
             {
               "password": "Env.password"

             }
            """
    And I replace the values of the body request
  When I execute the request
  Then I expect a '400' status code