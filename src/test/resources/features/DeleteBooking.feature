@happyflowscenario
Feature: Delete Booking Details

Background:
	Given user hits endpoint "api/auth/login"
	When user creates a auth token with login authentication as "admin" and "password"
	Then user should get the response code 200

Scenario: Delete a booking
	Given user hits endpoint "api/booking"
    And user books the room with the given details
	  | firstname   | lastname   | email   | phone   | checkin   | checkout   |	
      | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> |
	Then the response status code should be 200
	When User requests the details of the room by room id
	Then the response status code should be 200
	Given user hits endpoint "api/booking/"
	When the user deletes the booking with booking ID
	Then the response status code should be 200

	Examples:
      | firstname | lastname | email              | phone       | checkin    | checkout   |
      | User      | five     | user.five@gmail.com| 46645895464 | 2025-09-15 | 2025-09-17 |