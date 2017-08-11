Feature: CRUD - Update an existing meeting

  Background: Create a meeting in order to update it later
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

  Scenario: Update the meeting using a different valid 'user' email
  than the used as a value for the 'organizer' field when the meeting
  was created

    When I make a 'PUT' request to '/meetings/{meetingId}'
      And I set this body:
        """
          {
            "organizer": "agony@arabitpro.local",
            "subject": "Subject Updated",
            "body": "Body Updated",
            "start": "2019-03-01T21:00:00.000Z",
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
      And the '_id' value of the response body should remain unchanged
      And the JSON should have the following:
        | organizer         | "agony@arabitpro.local"    |
        | subject           | "Subject Updated"          |
        | start             | "2019-03-01T21:00:00.000Z" |
        | end               | "2019-03-01T21:30:00.000Z" |
        | rooms             | ["RM@arabitpro.local"]     |
        | attendees         | []                         |
        | optionalAttendees | []                         |
#    And the JSON at "organizer" should be "agony@arabitpro.local"

