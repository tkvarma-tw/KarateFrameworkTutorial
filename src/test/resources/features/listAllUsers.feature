Feature: List users

  Scenario: Verify whether ListUsers api is able to list all users
    Given url "https://reqres.in/api/users"
    And param page = "2"
    When method GET
    Then status 200
    And print response.data[0].email
    And assert response.data[0].email == "michael.lawson@reqres.in"

  Scenario: Verify whether CreateUsers api is able to create users
    Given url "https://reqres.in/api/users"
    And request {"name": "Jayabal","job": "leader"}
    When method POST
    Then status 201
    And assert response.name == "Jayabal"
    And print "user id is "+response.id

  Scenario: Verify whether chaining of API is working
    Given url "https://reqres.in/api/users"
    And param page = "2"
    When method GET
    Then status 200
    And print response.data[0].id

    Given url "https://reqres.in/api/users"
    And path response.data[0].id
    When method GET
    Then status 200
    And assert response.data.email == "michael.lawson@reqres.in"
    And match response.data.email == '#notnull'
    And match response.data.email == '#present'
    And match response.data.email == '#string'
  	

