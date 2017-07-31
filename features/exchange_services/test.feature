Feature: test

  test for configuration of the travis
  Scenario: test get
    * I GET request of services
    * I POST request of services:
      | subjects          | test       |
      | body              | test       |
      | start             | 207-07-30  |
      | end               | 2017-08-05 |
      | location          | test       |
      | attendees         |            |
      | optionalAttendees |            |
