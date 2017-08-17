# Author: Daniel Cabero
@functional
Feature: FUNCTIONAL, delete request with different cases.

  Background: Creation exchanges meeting for before delete request.
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
          "attendees": [
          "candace.flynn@server.lab"
          ],
          "optionalAttendees": [
          "stacy.hirano@server.lab"
          ]
        }
        """
    And I execute the request
    And I store the '_id' as '{meetingId}'

  Scenario : Delete expecific exchanges meeting
    When I make a 'DELETE' request to '/meetings/{meetingId}'
    And I set this headers exchange:
      | Content-type         | application/json |
      | Exchange-Credentials | credentialId     |
      | Exchange-Calendar    | mail_account     |
    And I execute the request
    Then I expect a '200' status code

  Scenario: Delete exchanges meeting with meetingId invalid
    When I make a 'DELETE' request to '/meetings/meetingInvalid'
    And I set this headers exchange:
      | Content-type         | application/json |
      | Exchange-Credentials | credentialId     |
      | Exchange-Calendar    | mail_account     |
    And I execute the request
    Then I expect a '400' status code

  Scenario: Delete exchanges meeting with meetingId invalid and invalid meeting id
    When I make a 'DELETE' request to '/meetings/meetingInvalid'
    And I set this headers exchange:
      | Content-type         | application/json  |
      | Exchange-Credentials | credentialInvalid |
      | Exchange-Calendar    | mail_account      |
    And I execute the request
    Then I expect a '400' status code


  Scenario Outline : Delete exchanges meeting
    When I make a 'DELETE' request to '/meetings/<serviceId>'
    Examples:
      | serviceId        |
      | {meetingId}      |
      | {meetingInvalid} |
      | {meetingInvalid} |
    And I set this headers exchange:
      | Content-type         | application/json |
      | Exchange-Credentials | <credential>     |
      | Exchange-Calendar    | mail_account     |
    Examples:
      | credential        |
      | credentialId      |
      | credentialId      |
      | credentialInvalid |
    And I execute the request

    Then I expect a '<status_code>' status code
    Examples:
      | status_code |
      | 200         |
      | 400         |
      | 400         |
