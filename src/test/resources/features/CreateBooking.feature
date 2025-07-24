@CreateBooking @hotelbookingregressiontests
Feature: Test create a room booking

@happyflowscenario
Scenario Outline: Create a room booking
    Given user hits endpoint "api/booking"
    When user books the room with the given details
		| firstname   | lastname   | email   | phone   | checkin   | checkout   |	
        | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> |
    Then the response status code should be 200

    Examples:
      | firstname | lastname | email              | phone       | checkin    | checkout   |
      | User      | five     | user.five@gmail.com| 46645895464 | 2025-09-15 | 2025-09-17 |
      | User      | two      | user.two@gmail.com | 77775895464 | 2025-10-15 | 2025-10-17 |
      | User      | one      | user.one@gmail.com | 46666895464 | 2025-11-15 | 2025-11-17 |
      
@erorrs
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