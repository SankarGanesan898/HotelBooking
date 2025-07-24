@getbooking @hotelbookingregressiontests
Feature: Get booking details

Background:
	Given user hits endpoint "api/auth/login"
	When user creates a auth token with login authentication as "admin" and "password"
	Then user should get the response code 200 

@getroomdetails
Scenario: Get the details of the room by room id
	Given user hits endpoint "api/booking"
	When asks the details of the room by room id 421
	Then the response status code should be 200

@performschemavalidation
Scenario: Get the details of the room by room id and perform schema validation
	Given user hits endpoint "api/booking"
	When asks the details of the room by room id 421
	Then the response status code should be 200
	Then validate the response with json schema "getbookingresponseschema.json"

@getroomsummary
Scenario: Get the details of the room summary
	Given user hits endpoint "api/room"
	When user requests the room summary details
	Then the response status code should be 200
	
@getroomavailability
Scenario: Get the details of the room availability
	Given user hits endpoint "api/room"
	When user requests the room availability details from "2025-08-17" to "2025-08-19" dates
	Then the response status code should be 200

@invalidpassword
Scenario: validate the response code for invalid password
    Given user hits endpoint "api/auth/login"
    When user creates a auth token with login authentication as "admin" and "password123"
    Then user should get the response code 401

@errorcodes
Scenario: validate the response code when retrieving details with missing room id
	Given user hits endpoint "api/auth/login"
	When user creates a auth token with login authentication as "admin" and "password"
	Then user should get the response code 200
	Given user hits endpoint "api/booking"
	When user searches booking details with missing room id
	Then the response status code should be 400
