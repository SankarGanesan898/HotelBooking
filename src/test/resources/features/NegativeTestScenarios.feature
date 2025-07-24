@negativetests
Feature: negative test scenarios

Background:
	Given user hits endpoint "api/auth/login"
	When user creates a auth token with login authentication as "admin" and "password"
	Then user should get the response code 200

Scenario: validate the response code for invalid password
    Given user hits endpoint "api/auth/login"
    When user creates a auth token with login authentication as "admin" and "password123"
    Then user should get the response code 401

Scenario: validate the response code when retrieving details with missing room id
	Given user hits endpoint "api/auth/login"
	When user creates a auth token with login authentication as "admin" and "password"
	Then user should get the response code 200
	Given user hits endpoint "api/booking"
	When user searches booking details with missing room id
	Then the response status code should be 400

Scenario Outline: create a booking with incorrect field values
	Given user hits endpoint "api/booking"
    And user books the room with the given details
      | firstname   | lastname   | email   | phone   | checkin   | checkout   | bookingid   |
      | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> | <bookingid> |
    Then the response status code should be 400
	And the user should see response with incorrect "<FieldError>"

    Examples:
      | firstname | lastname | email               | phone        | checkin    | checkout   | FieldError                          |
      |           | last     | user@gmail.com      | 879558797034 | 2025-03-15 | 2025-03-18 | Firstname should not be blank       |
      | user.     | e        | last@gmail.com      | 879558797034 | 2025-03-15 | 2025-03-18 | size must be between 3 and 30       |
      | Uasr      | LAST     | user                | 879558797034 | 2025-03-15 | 2025-03-18 | must be a well-formed email address |
      | user      | last     | userlast@gmail.com  | 8795587970   | 2025-03-15 | 2025-03-18 | size must be between 11 and 21      |
      | user      | last     | user.last@gmail.com | 879558797034 |            | 2025-03-18 | must not be null                    |