Feature: Create a user

  @ignore
  Scenario: Create a user
    Given url appBaseURL
    And path "users"
    And request {name: '#(name)', job: 'QA'}
    When method POST
    Then status 201
    * def userId = response
    * print userId