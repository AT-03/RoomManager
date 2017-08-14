@functional
Feature: POST a new service with existing ip

  @delete_services
  Scenario: : Create a new service using existing ip
    Given I make a 'POST' request to '/services'
      And I set this body:
          """
          {
            "hostname": "10.28.124.148",
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