# Author: Daniel Cabero
@functional
Feature: FUNCTIONAL, put request for different cases.

  Background: Creation exchanges meeting for before update with the put request.
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

  Scenario: put request without attenders.
    When I make a 'PUT' request to '/meetings/{meetingId}'
    And I set this headers exchange:
      | Content-type         | application/json |
      | Exchange-Credentials | credentialId     |
      | Exchange-Calendar    | mail_account     |
    And I set this body:
      """
        {
          "subject": "Scrum",
          "body": "Scrum of Room Manager",
          "start": "2017-10-25T16:00:00.00Z",
          "end": "2017-10-25T17:00:00.00Z",
          "location": "Arani",
          "attendees": [
          ],
          "optionalAttendees": [
          ]
        }
        """
    And I execute the request
    Then I expect a '200' status code
    And the response should be:
      """
        {
          "subject": "Scrum",
          "body": "Scrum of Room Manager",
          "start": "2017-10-25T16:00:00.00Z",
          "end": "2017-10-25T17:00:00.00Z",
          "location": "Arani",
          "attendees": [
          ],
          "optionalAttendees": [
          ]
        }
        """

  Scenario:put request with attenders empty .
    When I make a 'PUT' request to '/meetings/{meetingId}'
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
        "location": "",
        "attendees": [
               ],
        "optionalAttendees": [ "AT03@arabitpro.local"
        ]
      }
      """
    And I execute the request
    Then I expect a '200' status code

  Scenario:put request with account incorrect.
    When I make a 'PUT' request to '/meetings/{meetingId}'
    And I set this headers exchange:
      | Content-type         | application/json  |
      | Exchange-Credentials | credentialInvalid |
      | Exchange-Calendar    | mail_account      |
    And I set this body:
          """
            {
              "subject": "Scrum",
              "body": "Scrum of Room Manager",
              "start": "2017-10-25T16:00:00.00Z",
              "end": "2017-10-25T17:00:00.00Z",
              "location": "Arani",
              "attendees": "",
              "optionalAttendees":""
            }
            """
    And I execute the request
    Then I expect a '401' status code

  Scenario:put request with empty body.
    When I make a 'PUT' request to '/meetings/{meetingId}'
    And I set this headers exchange:
      | Content-type         | application/json |
      | Exchange-Credentials | credentialId     |
      | Exchange-Calendar    | mail_account     |
    And I set this body:
          """
            {
            }
            """
    And I execute the request
    Then I expect a '400' status code

  Scenario:put request with invalid date.
    When I make a 'PUT' request to '/meetings/{meetingId}'
    And I set this headers exchange:
      | Content-type         | application/json |
      | Exchange-Credentials | credentialId     |
      | Exchange-Calendar    | mail_account     |
    And I set this body:
          """
            {
              "subject": "Scrum",
              "body": "Scrum of Room Manager",
              "start": "2019-02-30T16:00:00.00Z",
              "end": "2019-02-30T17:00:00.00Z",
              "location": "Arani",
              "attendees": "",
              "optionalAttendees":""
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

  Scenario:put request with empty body.
    When I make a 'PUT' request to '/meetings/{meetingId}'
    And I set this headers exchange:
      | Content-type         | application/json |
      | Exchange-Credentials | credentialId     |
      | Exchange-Calendar    | mail_account     |
    And I set this body:
          """
            {
            }
            """
    And I execute the request
    Then I expect a '400' status code
    And the response should be:
          """
            {
              "name": "SchemaValidationError",
              "description": "data should have required property 'attendees'"
            }
          """

  Scenario: : Create a exchanges meeting with date incorrect(29/02)
    Given I make a 'PUT' request to '/meetings/{meetingId}'
    And I set this headers exchange:
      | Content-type         | application/json |
      | Exchange-Credentials | credentialId     |
      | Exchange-Calendar    | mail_account     |
    And I set this body:
        """
        {
          "subject": "Scrum",
          "body": "Scrum of Room Manager",
          "start": "2017-02-29T16:00:00.00Z",
          "end": "2017-02-29T17:00:00.00Z",
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
    Then I expect a '400' status code
    And the response should be:
        """
          {
              "name": "ExchangeError",
              "description": "The specified date isn't valid."
          }
        """

  Scenario: update a exchanges meeting with invalid date without location
    Given I make a 'PUT' request to '/meetings/{meetingId}'
    And I set this headers exchange:
      | Content-type         | application/json |
      | Exchange-Credentials | credentialId     |
      | Exchange-Calendar    | mail_account     |
    And I set this body:
        """
        {
          "subject": "Scrum",
          "body": "Scrum of Room Manager",
          "start": "2018-09-25T16:00:00.00Z",
          "end": "2018-09-29T17:00:00.00Z",
          "location": "",
          "attendees": [
          "administrator@arabitpro.local"
          ],
          "optionalAttendees": [
          "stacy.hirano@server.lab"
          ]
        }
        """

    And I execute the request
    Then I expect a '200' status code
    And the response should be:
        """
          {
          "subject": "Scrum",
          "body": "Scrum of Room Manager",
          "start": "2018-09-25T16:00:00.00Z",
          "end": "2018-09-29T17:00:00.00Z",
          "location": "",
          "attendees": [
          "administrator@arabitpro.local"
          ],
          "optionalAttendees": [
          "stacy.hirano@server.lab"
          ]
        }
        """

  Scenario: update a exchanges meeting without start time and end time.
    Given I make a 'PUT' request to '/meetings/{meetingId}'
    And I set this headers exchange:
      | Content-type         | application/json |
      | Exchange-Credentials | credentialId     |
      | Exchange-Calendar    | mail_account     |
    And I set this body:
        """
        {
          "subject": "Scrum",
          "body": "Scrum of Room Manager",
          "start": "" ,
          "end": "",
          "location": "",
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
          {
            "name": "SchemaValidationError",
            "description": "data.start should match format \"date-time\""
          }
        """

  Scenario: update a exchanges meeting with start, end time empty.
    Given I make a 'PUT' request to '/meetings/{meetingId}'
    And I set this headers exchange:
      | Content-type         | application/json |
      | Exchange-Credentials | credentialId     |
      | Exchange-Calendar    | mail_account     |
    And I set this body:
        """
        {
          "subject": "Scrum",
          "body": "Scrum of Room Manager",
          "start": "",
          "end": "",
          "location": "",
          "attendees": [
          "candace.flynn@server.lab"
          ],
          "optionalAttendees": [
          "stacy.hirano@server.lab"
          ]
        }
        """

    And I execute the request
    Then I expect a '400' status code

  Scenario: update a exchanges meeting with invalid meeting id
    Given I make a 'PUT' request to '/meetings/meetingId1'
    And I set this headers exchange:
      | Content-type         | application/json  |
      | Exchange-Credentials | credentialInvalid |
      | Exchange-Calendar    | mail_account      |
    And I set this body:
        """
        {
          "subject": "Scrum",
          "body": "Scrum of Room Manager",
          "start": "2018-09-25T16:00:00.00Z",
          "end": "2018-09-29T17:00:00.00Z",
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
          {
            "name": "MeetingNotFoundError",
            "description": "The meeting doesn't exist in the database."
          }
        """

  Scenario: update a exchanges meeting without subject and body
    Given I make a 'PUT' request to '/meetings/{meetingId}'
    And I set this headers exchange:
      | Content-type         | application/json |
      | Exchange-Credentials | credentialId     |
      | Exchange-Calendar    | mail_account     |
    And I set this body:
        """
        {

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
          {
            "name": "SchemaValidationError",
            "description": "data should have required property 'subject'"
          }
        """

  Scenario: update a exchanges meeting without body
    Given I make a 'PUT' request to '/meetings/{meetingId1}'
    And I set this headers exchange:
      | Content-type         | application/json |
      | Exchange-Credentials | credentialId     |
      | Exchange-Calendar    | mail_account     |
    And I set this body:
        """
        {
          "subject": "Scrum",
          "start": "2018-09-25T16:00:00.00Z",
          "end": "2018-09-29T17:00:00.00Z",
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
    Then I expect a '401' status code
    And the response should be:
        """
          {
            "name": "SchemaValidationError",
            "description": "data should have required property 'body'"
          }
        """

  Scenario: update a exchanges meeting without body, subject empty and invalid credential
    Given I make a 'PUT' request to '/meetings/{meetingId}'
    And I set this headers exchange:
      | Content-type         | application/json  |
      | Exchange-Credentials | credentialInvalid |
      | Exchange-Calendar    | mail_account      |
    And I set this body:
        """
        {
          "subject": "",
          "body": "",
          "start": "2017-09-25T16:00:00.00Z",
          "end": "2017-09-25T17:00:00.00Z",
          "location": "Arani",
          "attendees": [
          "administrator@arabitpro.local"
          ],
          "optionalAttendees": [
          "stacy.hirano@server.lab"
          ]
        }
        """

    And I execute the request
    Then I expect a '401' status code
    And the response should be:
        """
         "subject": "",
          "body":""
          "start": "2018-09-25T16:00:00.00Z",
          "end": "2018-09-29T17:00:00.00Z",
          "location": "arani",
          "attendees": [
          "administrator@arabitpro.local"
          ],
          "optionalAttendees": [
          "stacy.hirano@server.lab"
          ]
        """

  Scenario: example update a exchanges meeting without body, subject empty and invalid credential
    Given I make a 'PUT' request to '/meetings/{meetingId}'
    And I set this headers exchange:
      | Content-type         | application/json |
      | Exchange-Credentials | credentialId     |
      | Exchange-Calendar    | mail_user        |

    And I set this body:
        """
        {
          "subject":"",
          "body": "",
          "start": "2017-09-25T16:00:00.00Z",
          "end": "2017-09-25T17:00:00.00Z",
          "location": "Arani",
          "attendees": [
          "administrator@arabitpro.local"
          ],
          "optionalAttendees": [
          "stacy.hirano@server.lab"
          ]
        }
        """
#    And I load headers exchanges
    And I execute the request
    Then I expect a '200' status code
#    And the response should be:
#        """{
#           "subject":"",
#          "body": "",
#          "start": "2017-09-25T16:00:00.00Z",
#          "end": "2017-09-25T17:00:00.00Z",
#          "location": "Arani",
#          "attendees": [
#          "administrator@arabitpro.local"
#          ],
#          "optionalAttendees": [
#          "stacy.hirano@server.lab"
#          ]
#          }
#        """
#
