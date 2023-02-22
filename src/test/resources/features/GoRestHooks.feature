Feature: GoRestHooks

  Background:
    * def userData = call read('CreateGoRestUser.feature')
    * url "https://gorest.co.in/public/v2/users"
    * header Authorization = 'Bearer ' + authToken

    * configure afterScenario =
    """
function(){
  karate.log('after scenario:', karate.scenario.name);
}
"""

    * configure afterFeature =
    """
function(){
  karate.log('after feature:', karate.feature.name);
}
"""

  Scenario: Get details of user
    #* print userData
    Given path userData.response.id
    When method GET
    Then status 200
    And match response.name == userData.response.name
    And match response.status == userData.response.status

  Scenario: Update user data
    * def requestBody =
    """
    {"name": "jamesupdatedzz"}
    """
    Given path userData.response.id
    And request requestBody
    When method PUT
    Then status 200
    And match response.name == requestBody.name
    And match response.status == userData.response.status

  Scenario: Delete user
    Given path userData.response.id
    When method DELETE
    Then status 204
