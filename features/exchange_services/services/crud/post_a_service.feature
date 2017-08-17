#Author: Juan Aitken
@crud
Feature: CRUD - Create a new service, using a valid 'hostname' with valid credentials
  @delete_services
  Scenario: A new service should be created after used the correct parameters
    Given I make a 'POST' request to '/services'
    When  I load exchange server credentials
      And I set this body:
          """
           {
             "hostname": "Env.hostname",
             "username": "Env.user",
             "password": "Env.password"
           }
          """
    And I replace the values of the body request
    When I execute the request
    Then I expect a '200' status code
      And a response body as:
          """
          {
            "type": "ExchangeServer",
            "name": "Exchange Server 2016",
            "version": "15.1 (Build 30225.42)"
          }
          """
