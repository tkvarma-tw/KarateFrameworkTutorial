Feature: GetUserDetails

  Scenario: Get all user details
    Given url "https://reqres.in/api/users"
    And param page = "2"
    When method GET
    Then status 200