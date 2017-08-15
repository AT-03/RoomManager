# Author: Daniel Cabero
@functional
Feature: FUNCTIONAL, post the exchange meeting

  Scenario: Create a exchanges meeting without attendees
    Given I make a 'POST' request to '/meetings'
    And I set this headers exchange:
      | Content-type         | application/json |
      | Exchange-Credentials | credentialId     |
      | Exchange-Calendar    | mail_account     |
    And I set this body:
      """
      {
        "subject": "Scrum",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-09-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": [],
        "optionalAttendees": []
      }
      """
    And I execute the request
    And I store the '_id' as '{meetingId}'
    Then I expect a '200' status code
    And the response should be:
      """
      {
        "subject": "Scrum",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-09-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": [],
        "optionalAttendees": []
      }
      """


  Scenario: Create a exchanges meeting without attendees empty
    Given I make a 'POST' request to '/meetings'
    And I set this headers exchange:
      | Content-type         | application/json |
      | Exchange-Credentials | credentialId     |
      | Exchange-Calendar    | mail_account     |
    And I set this body:
      """
      {
        "subject": "Scrum",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-09-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": "",
        "optionalAttendees":""
      }
      """
    And I execute the request
    Then I expect a '400' status code

  Scenario: Create a exchanges meeting with attendeers delete
    Given I make a 'POST' request to '/meetings'
    And I set this headers exchange:
      | Content-type         | application/json |
      | Exchange-Credentials | credentialId     |
      | Exchange-Calendar    | mail_account     |
    And I set this body:
      """
      {
        "subject": "Scrum",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-09-25T17:00:00.00Z",
        "location": "Arani"
      }
      """
    And I execute the request
    Then I expect a '400' status code

  Scenario: Create a exchanges meeting with invalid attendees
    Given I make a 'POST' request to '/meetings'
    And I set this headers exchange:
      | Content-type         | application/json |
      | Exchange-Credentials | credentialId     |
      | Exchange-Calendar    | mail_account     |
    And I set this body:
      """
      {
        "subject": "Scrum",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-09-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": ["AT03@arabitpro.local"],
        "optionalAttendees":[]
      }
      """
    And I execute the request
    Then I expect a '200' status code
    And the response should be:
    """
      {
        "subject": "Scrum",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-09-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": ["AT03@arabitpro.local"],
        "optionalAttendees":[]
      }
      """

  Scenario: Create a exchanges meeting with invalid Optional attendees
    Given I make a 'POST' request to '/meetings'
    And I set this headers exchange:
      | Content-type         | application/json |
      | Exchange-Credentials | credentialId     |
      | Exchange-Calendar    | mail_account     |
    And I set this body:
      """
      {
        "subject": "Scrum",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-09-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": [],
        "optionalAttendees":["AT03@arabitpro.local"]
      }
      """
    And I execute the request
    Then I expect a '200' status code
    And the response should be:
    """
      {
        "subject": "Scrum",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-09-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": [],
        "optionalAttendees":["AT03@arabitpro.local"]
      }
      """

  Scenario: Create a exchanges meeting with attendeers delete
    Given I make a 'POST' request to '/meetings'
    And I set this headers exchange:
      | Content-type         | application/json |
      | Exchange-Credentials | credentialId     |
      | Exchange-Calendar    | mail_account     |
    And I set this body:
      """
      {
        "subject": "Scrum",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-09-25T17:00:00.00Z",
        "location": "Arani"
      }
      """
    And I execute the request
    Then I expect a '400' status code

  Scenario: Create a exchanges meeting with invalid exchanges credential
    Given I make a 'POST' request to '/meetings'
    And I set this headers exchange:
      | Content-type         | application/json  |
      | Exchange-Credentials | credentialInvalid |
      | Exchange-Calendar    | mail_account      |
    And I set this body:
      """
      {
        "subject": "Scrum",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-09-25T17:00:00.00Z",
        "location": "Arani",
        "attendees":[],
        "optional"
      }
      """
    And I execute the request
    Then I expect a '400' status code

  Scenario: Create a exchanges meeting with invalid exchanges calendar
    Given I make a 'POST' request to '/meetings'
    And I set this headers exchange:
      | Content-type         | application/json     |
      | Exchange-Credentials | credentialId         |
      | Exchange-Calendar    | mail_account_invalid |
    And I set this body:
      """
      {
        "subject": "Scrum",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-09-25T17:00:00.00Z",
        "location": "Arani",
        "attendees":[],
        "optional"
      }
      """
    And I execute the request
    Then I expect a '400' status code

  Scenario: Create a exchanges meeting with date incorrect(02/30)
    Given I make a 'POST' request to '/meetings'
    And I set this headers exchange:
      | Content-type         | application/json |
      | Exchange-Credentials | credentialId     |
      | Exchange-Calendar    | mail_account     |
    And I set this body:
      """
      {
        "subject": "Scrum",
        "body": "Scrum of Room Manager",
        "start": "2018-02-30T16:00:00.00Z",
        "end": "2018-02-30T17:00:00.00Z",
        "location": "Arani",
        "attendees": [],
        "optionalAttendees":["AT03@arabitpro.local"]
      }
      """
    And I execute the request
    Then I expect a '400' status code
    And the response should be:
        """
           {
            "name": "ExchangeError",
            "description": "The specified date isn't valid."
           }
        """

  Scenario: Create a exchanges meeting without subject and body empty
    Given I make a 'POST' request to '/meetings'
    And I set this headers exchange:
      | Content-type         | application/json |
      | Exchange-Credentials | credentialId     |
      | Exchange-Calendar    | mail_account     |
    And I set this body:
        """
        {
          "subject": "",
          "body":""
          "start": "2018-09-25T16Z",
          "end": "2018-09-29T17Z",
          "location": "arani",
          "attendees": [
          "administrator@arabitpro.local"
          ],
          "optionalAttendees": [
          "stacy.hirano@server.lab"
          ]
        }
        """

    And I execute the request
    Then I expect a '400' status code
    And the response should be:
        """
          "name": "SchemaValidationError",
          "description": "data.start should match format \"date-time\""
        """





