Feature: Create User

  Scenario: Create a user from pay load
    * def classInitaliser = Java.type('stepdefinitions.CustomStepDefinitions')
    * def generatedEmail = classInitaliser.GenerateEmail('Satya')
    Given url "https://gorest.co.in"
    And path "/public/v2/users"
    And header Authorization = 'Bearer ' + authToken
    And request { "name": "james",email: '#(generatedEmail)', "gender": "male","status": "active"}
    When method POST
    Then status 201
    And match response.id == '#present'
    And match response.name == 'james'