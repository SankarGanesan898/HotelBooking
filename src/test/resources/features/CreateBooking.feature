Feature: Test create a room booking

@testcreate1
Scenario Outline: Create a room booking
    Given user hits endpoint "api/booking"
    When user books the room with the given details
		| firstname   | lastname   | email   | phone   | checkin   | checkout   |	
        | <firstname> | <lastname> | <email> | <phone> | <checkin> | <checkout> |
    Then the response status code should be 200

    Examples:
      | firstname | lastname | email              | phone       | checkin    | checkout   |
      | User      | five     | user.five@gmail.com| 46645895464 | 2025-09-15 | 2025-09-17 |