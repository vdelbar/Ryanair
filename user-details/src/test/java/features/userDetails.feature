# This endpoint will validate all the stuff related to USER endpoint.

@userDetails
Feature: user details 

Background:
    * url baseUrl

## HappyPaths      
#Tag-0
  Scenario: Create user [Code 201]
    * def requestUser = read('../requests/create/userCreated.json')
    * def responseUser = read('../responses/create/userCreated.json')
    Given path '/user'
    And request requestUser
    When method post
    Then status 201     
    And match responseUser.data.name == requestUser.name

#Tag-1
  Scenario Outline: Verify valid user [Code 200] 
    * def response = read('../responses/userDetails/validUser.json')
    * def query = {'id': <id>}
    Given path '/user'
    And  params query
    When method get
    Then status 200
    And match response.id == query.id

    Examples:
        |                    id                     |        
        |    'popor@gmail.com-0.11491059551051885'  |

#Tag-2
  Scenario Outline: Verify receiving all users [Code 200] 
    * def response = read('../responses/userDetails/validUser.json')
    * def query = {}
    Given path '/user/all'
    And  params query
    When method get
    Then status 200

    Examples:
        |                       |        
        |                       |


## UnHappyPaths      
#Tag-0 - user not found
  Scenario Outline: Verify valid user [Code 404] 
    * def response = read('../responses/userDetails/validUser.json')
    * def query = {'id': <id>}
    Given path '/user'
    And  params query
    When method get
    Then status 404

    Examples:
        |               id                 |        
        |    'popor@gmail.com-0.notExist'  |

#Tag-1 - malformed mail
  Scenario: Verify valid format [Code 500]
    * def requestUser = read('../requests/create/userCreated_WrongMail.json')
    Given path '/user'
    And request requestUser
    When method post
    Then status 500     

  #Tag-2 - malformed json
  Scenario: Verify valid json [Code 409]
    * def requestUser = read('../requests/create/userCreated_WrongJson.json')
    Given path '/user'
    And request requestUser
    When method post
    Then status 409   