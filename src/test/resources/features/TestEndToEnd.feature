Feature: Test end to end flow

Background:
	Given user hits endpoint "api/auth/login"
	When user creates a auth token with login authentication as "admin" and "password"
	Then user should get the response code 200

@teste2e
Scenario Outline: Test end to end flow    
    Given user hits endpoint "api/booking"
    And user books the room with the given details
		| firstname   | lastname   | email   | phone   | checkin   | checkout   |	
        | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> |
	Then user should get the response code 200
    Given user hits endpoint "api/booking"
	When User requests the details of the room by room id
	Then the response status code should be 200
	Given user hits endpoint "api/booking/"
	When the user edits the booking details
      | firstname | lastname | email              | phone         | checkin    | checkout   |
      | User      | two   	 | user.two@gmail.com | 46546321354   | 2025-08-21 | 2025-08-23 |
	Then the response status code should be 200
	When the user deletes the booking with booking ID
	Then the response status code should be 200    	    
	
	Examples:
     | firstname | lastname | email              | phone         | checkin    | checkout   |
     | User      | five     | user.five@gmail.com | 46645895464 | 2025-09-15 | 2025-09-17 |