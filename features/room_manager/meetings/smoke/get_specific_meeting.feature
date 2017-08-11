Feature: SMOKE, GET request to a specific meeting

  Background: Create a meeting
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
      And I store the response
      And I store the '_id' as '{meetingId}'

  Scenario: Retrieve a specific meeting
    When I make a 'GET' request to '/meetings/{meetingId}'
      And I set this queries:
        | owner | administrator@arabitpro.local |
        | start | 2019-03-01T00:00:00.000Z      |
        | end   | 2019-03-31T23:59:59.000Z      |
      And I execute the request
      And after build a expected response with the fields:
        | _id               |
        | organizer         |
        | subject           |
        | body              |
        | start             |
        | end               |
        | rooms             |
        | attendees         |
        | optionalAttendees |

    Then I expect a '200' status code
      And the JSON at "_id" should be an string
      And the built response should be equal to the obtained response