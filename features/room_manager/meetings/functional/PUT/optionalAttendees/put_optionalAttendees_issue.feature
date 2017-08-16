# Author: Daniel Montecinos

@functional @negative @issue
Feature: FUNCTIONAL

  Background: Create a meeting and set 'optionalAttendees' with an array
  of zero or more valid 'user' emails (set the remaining parameters with
  correct values) and store its id

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

  Scenario: Try to update the 'optionalAttendees' field of an exiting meeting
  with an array of four invalid 'user' emails and using a valid id
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
            "attendees": [],
            "optionalAttendees": [
              "invalid_user_one@arabitpro.local",
              "invalid_user_two@arabitpro.local",
              "invalid_user_three@arabitpro.local",
              "invalid_user_four@arabitpro.local"
            ]
          }
        """
    And I execute the request
    Then I expect a '400' status code

  Scenario: Try to update the 'optionalAttendees' field of an exiting
  meeting with an array that contains four 'user' emails where all of
  them are the same and using a valid id
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
              "attendees": [],
              "optionalAttendees": [
                "agony@arabitpro.local",
                "agony@arabitpro.local",
                "agony@arabitpro.local",
                "agony@arabitpro.local"
              ]
            }
          """
      And I execute the request
    Then I expect a '400' status code
