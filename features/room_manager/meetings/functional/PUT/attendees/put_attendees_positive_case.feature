# Author: Daniel Montecinos

@functional @positive
Feature: FUNCTIONAL

  Background: Create a meeting and set 'attendees' with an array of zero
  or more valid 'user' emails (set the remaining parameters with correct
  values) and store its id
    Given I make a 'POST' request to '/meetings'
    And I set this body:
        """
        {
          "organizer": "Administrator@arabitpro.local",
          "subject": "Subject Test",
          "body": "Body Test",
          "start": "2019-03-01T20:00:00.000Z",
          "end": "2019-03-01T20:30:00.000Z",
          "rooms": [
            "RM@arabitpro.local"
          ],
          "attendees": [],
          "optionalAttendees": []
        }
        """
    And I execute the request
    And I store the '_id' as '{meetingId}'

  Scenario: Try to update the 'attendees' field of an exiting meeting with an
  array that contains four valid 'user' emails and using a valid id
    When I make a 'PUT' request to '/meetings/{meetingId}'
      And I set this body:
          """
            {
              "organizer": "Administrator@arabitpro.local",
              "subject": "Subject Test",
              "body": "Body Test",
              "start": "2019-03-01T20:00:00.000Z",
              "end": "2019-03-01T20:30:00.000Z",
              "rooms": [
                "RM@arabitpro.local"
              ],
              "attendees": [
                "agony@arabitpro.local",
                "pablopzsj@arabitpro.local",
                "jpaitken@arabitpro.local",
                "dcabero@arabitpro.local"
              ],
              "optionalAttendees": []
            }
          """
      And I execute the request
    Then I expect a '200' status code
      And the JSON at "attendees" should be:
        """
          [
            "agony@arabitpro.local",
            "pablopzsj@arabitpro.local",
            "jpaitken@arabitpro.local",
            "dcabero@arabitpro.local"
          ]
        """