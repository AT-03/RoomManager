# Author: Daniel Montecinos

@functional @positive
Feature: FUNCTIONAL

  Background:  Create a meeting and set 'end' field with correct dates,
  e.g. 2019-03-01T20:30:00.000Z (set the remaining parameters with correct
  values), store its id and take note the hour the 'end' field has
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

  Scenario: Try to update the 'end' field of an exiting meeting with a
  date greater than the 'start' field has and using a valid id
    When I make a 'PUT' request to '/meetings/{meetingId}'
    And I set this body:
        """
          {
            "organizer": "Administrator@arabitpro.local",
            "subject": "Subject Test",
            "body": "Body Test",
            "start": "2019-03-01T20:00:00.000Z",
            "end": "2019-04-01T20:30:00.000Z",
            "rooms": [
              "RM@arabitpro.local"
            ],
            "attendees": [],
            "optionalAttendees": []
          }
        """
    And I execute the request
    Then I expect a '200' status code
    And the JSON at "end" should be "2019-04-01T20:30:00.000Z"

  Scenario: Try to update the 'end' field of an exiting meeting with an
  hour greater than the 'start' field has and using a valid id
    When I make a 'PUT' request to '/meetings/{meetingId}'
      And I set this body:
          """
            {
              "organizer": "Administrator@arabitpro.local",
              "subject": "Subject Test",
              "body": "Body Test",
              "start": "2019-03-01T20:00:00.000Z",
              "end": "2019-03-01T21:30:00.000Z",
              "rooms": [
                "RM@arabitpro.local"
              ],
              "attendees": [],
              "optionalAttendees": []
            }
          """
      And I execute the request
    Then I expect a '200' status code
      And the JSON at "end" should be "2019-03-01T21:30:00.000Z"