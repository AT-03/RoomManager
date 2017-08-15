# Author: Daniel Montecinos

@functional @negative
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
  date greater than the 'start' field has, but using '/' as date separator,
  instead '-' and using a valid id
    When I make a 'PUT' request to '/meetings/{invalidId}'
      And I set this body:
        """
          {
            "organizer": "Administrator@arabitpro.local",
            "subject": "Subject Test",
            "body": "Body Test",
            "start": "2019-03-01T20:00:00.000Z",
            "end": "2019/03/01T20:30:00.000Z",
            "rooms": [
              "RM@arabitpro.local"
            ],
            "attendees": [],
            "optionalAttendees": []
          }
        """
      And I execute the request
    Then I expect a '400' status code
      And the JSON should be:
      """
        {
          "name" : "ValidationError",
          "description" : "data.end should match format \"date-time\""
        }
      """

  Scenario: Try to update the 'end' field of an exiting meeting with an
  hour greater than the 'start' field has, but using '.' as date separator,
  instead ':' ' and using a valid id
    When I make a 'PUT' request to '/meetings/{invalidId}'
      And I set this body:
        """
          {
            "organizer": "Administrator@arabitpro.local",
            "subject": "Subject Test",
            "body": "Body Test",
            "start": "2019-03-01T20:00:00.000Z",
            "end": "2019-03-01T20.30.00.000Z",
            "rooms": [
              "RM@arabitpro.local"
            ],
            "attendees": [],
            "optionalAttendees": []
          }
        """
      And I execute the request
    Then I expect a '400' status code
      And the JSON should be:
      """
        {
          "name" : "ValidationError",
          "description" : "data.end should match format \"date-time\""
        }
      """

  Scenario: Try to update the 'end' field of an exiting meeting with a
  date less than the 'start' field has and using a valid id
    When I make a 'PUT' request to '/meetings/{invalidId}'
      And I set this body:
        """
          {
            "organizer": "Administrator@arabitpro.local",
            "subject": "Subject Test",
            "body": "Body Test",
            "start": "2019-03-01T20:00:00.000Z",
            "end": "2019-02-01T20:30:00.000Z",
            "rooms": [
              "RM@arabitpro.local"
            ],
            "attendees": [],
            "optionalAttendees": []
          }
        """
      And I execute the request
    Then I expect a '400' status code
      And the JSON should be:
      """
        {
          "name" : "SchemaValidationError",
          "description" : "Start shouldn't be greater than End."
        }
      """

  Scenario: Try to update the 'end' field of an exiting meeting with an
  hour less than the 'start' field has and using a valid id
    When I make a 'PUT' request to '/meetings/{invalidId}'
      And I set this body:
        """
          {
            "organizer": "Administrator@arabitpro.local",
            "subject": "Subject Test",
            "body": "Body Test",
            "start": "2019-03-01T20:00:00.000Z",
            "end": "2019-03-01T19:30:00.000Z",
            "rooms": [
              "RM@arabitpro.local"
            ],
            "attendees": [],
            "optionalAttendees": []
          }
        """
      And I execute the request
    Then I expect a '400' status code
      And the JSON should be:
      """
        {
          "name" : "SchemaValidationError",
          "description" : "Start shouldn't be greater than End."
        }
      """

  Scenario: Try to update the 'end' field of an exiting meeting with an
  hour less than the 'start' field has and using a valid id
    When I make a 'PUT' request to '/meetings/{invalidId}'
      And I set this body:
        """
          {
            "organizer": "Administrator@arabitpro.local",
            "subject": "Subject Test",
            "body": "Body Test",
            "start": "2019-03-01T20:00:00.000Z",
            "end": "",
            "rooms": [
              "RM@arabitpro.local"
            ],
            "attendees": [],
            "optionalAttendees": []
          }
        """
      And I execute the request
    Then I expect a '400' status code
      And the JSON should be:
      """
        {
          "name" : "ValidationError",
          "description" : "data.end should match format \"date-time\""
        }
      """