Feature: Create a user and get the details of same user

    Scenario: Get the user details
      * def resp = call read('CreateUser.feature') { name: 'Tushar'}
      * print resp.userId.id
      Given url appBaseURL
      And path "users", resp.userId.id
      When method GET
      Then status 404
      * match response != []
