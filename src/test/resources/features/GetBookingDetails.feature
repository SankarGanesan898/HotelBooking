Feature: Get the room details

Background:
	Given user hits endpoint "api/auth/login"
	When user creates a auth token with login authentication as "admin" and "password"
	Then user should get the response code 200 

@testget1
Scenario: Get the details of the room by booking id
	Given user hits endpoint "api/booking"
	When asks the details of the room by room id 421
	Then the response status code should be 200