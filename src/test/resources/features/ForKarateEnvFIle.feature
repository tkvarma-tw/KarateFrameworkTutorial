Feature: Create new users to the application

  Scenario: Verify whether new user can be created using java custom step definition

    * def classInitaliser = Java.type('stepdefinitions.CustomStepDefinitions')
    * def generatedEmail = classInitaliser.GenerateEmail('Jayabal')
    Given url appBaseURL
    And path "register"
    And request { email: '#(generatedEmail)'}
    When method POST
    Then status 400
    And print "Error message is "+response.error

  Scenario: Verify ListUsers api with retry
    Given url appBaseURL
    And path "users"
    And param page = "2"
    And retry until response.data.length > 2
    When method GET
    Then status 200
    And print response.data[0].email
    And assert response.data[0].email == "michael.lawson@reqres.in"

  Scenario: Verify CreateUsers api with payload file
    Given url appBaseURL
    And path "users"
    And request read('/../jsons/createUserPayload.json')
    When method POST
    Then status 201
    And assert response.name == "John"
    And print "user id is "+response.id