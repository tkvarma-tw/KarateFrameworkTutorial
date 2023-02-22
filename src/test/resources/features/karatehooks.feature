Feature:Karate Hooks

Background:
    Given url "https://reqres.in/api/users"
    And print "This is a Background step"

Scenario: Get details of first user in page 2
    * print userInfo
    Given path userInfo.response.data[0].id
    When method GET
    Then status 200
    And print response
    And assert response.data.email == "michael.lawson@reqres.in"

    Scenario: Get details of fourth user in page 2
        Given path userInfo.response.data[4].id
        When method GET
        Then status 200
        And print response
        And assert response.data.first_name == "George"