#Juan Aitken
@crud
Feature: CRUD - Update an existing service
  Background: Create a service
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
     And I store the '_id' as '{serviceId}'

@delete_services
  Scenario: Update the service using valid exchange credentials
    Given I make a 'PUT' request to '/services/{serviceId}'
          And I set this body:
      """
       {
          "username": "Juan Aitken",
          "password": "P@ssw0rd"
        }
      """
    When  I load exchange server credentials
    And I execute the request
    Then I expect a '200' status code
      And a response body as:
         """
          {
           "name": "Exchange Server 2016",
           "type": "ExchangeServer",
           "version": "15.1 (Build 30225.42)"
          }
         """

    @delete_services
  Scenario: Delete the service using valid exchange credentials
    Given I make a 'DELETE' request to '/services/{serviceId}'
    When I load exchange server credentials
      And I execute the request
    Then I expect a '204' status code
