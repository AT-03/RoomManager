@functional
Feature: POST a new service with invalid hostname

  @delete_services
  Scenario: : Create a new service using invalid hostname
    Given I make a 'POST' request to '/services'
      And I set this body:
          """
          {
            "hostname": "incorrect",
            "username": "Administrator",
            "password": "P@ssw0rd",
            "deleteLockTime": 10
          }
          """
    When I execute the request
    Then I expect a '409' status code
      And the JSON should be:
          """
          {
            "name": "RequestNetBIOSDomainError",
            "description": "Can't connect to LDAP server, please ensure the NetBIOS domain is correct and your computer belongs to the domain"
          }
          """
