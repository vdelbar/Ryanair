# This endpoint will validate all the stuff related to BOOKING
 endpoint.

@userDetails
Feature: booking details 

Background:
    * url baseUrl

## HappyPaths      
#Tag-0
  Scenario: Create booking [Code 201]
    * def requestBooking = read('../requests/create/bookingCreated.json')
    * def responseUser = read('../responses/create/bookingCreated.json')
    Given path '/booking'
    And request requestBooking
    When method post
    Then status 201     
    And match responseUser.idUser == requestBooking.id

#Tag-1
  Scenario Outline: Verify valid booking [Code 200] 
    * def response = read('../responses/bookingDetails/validBooking.json')
    * def query = {'id': <id>}
    Given path '/booking'
    And  params query
    When method get
    Then status 200
    * def size = karate.sizeOf(response)
    * def last = response[size - 1]
    And match last.idUser == query.id

    Examples:
        |                    id                     |        
        |    'popo@gmail.com-0.46884178669816645'   |

#Tag-2
  Scenario Outline: Asking for a date [Code 200] 
    * def response = read('../responses/bookingDetails/validBooking.json')
    * def query = {'id': <id>, 'date': <date>}
    Given path '/booking'
    And  params query
    When method get
    Then status 200
    * def size = karate.sizeOf(response)
    * def last = response[size - 1]
    And match last.date == query.date

    Examples:
        |                    id                     |     date    |        
        |    'popo@gmail.com-0.46884178669816645'   | '01-01-21'  | 


## UnHappyPaths       
#Tag-0
  Scenario Outline: Verify origin & destination [Code 409]
    Given path '/booking'
    And  request {"date": "string", "destination": <destination>, "id": "string", "origin": <origin>}
    When method post
    Then status 409

    Examples:
    |   destination    |    origin     |
    |       ""         |      ""       |
    |       ""         |     "EUR"     |
    |      "EUR"       |      ""       |

#Tag-1
  Scenario Outline: Verify date format [Code 400]
    Given path '/booking'
    And  request {"date": <date>, "destination": "ESP", "id": "string", "origin": "ESP"}
    When method post
    Then status 400

    Examples:
    |       date      | 
    |       ""        |
    |       "01"      |
    |      "27_01"    |

#Tag-2
  Scenario Outline: Verify ID format [Code 500]
    Given path '/booking'
    And  request {"date": <date>, "destination": "ESP", "id": "string", "origin": "ESP"}
    When method post
    Then status 500

    Examples:
    |     date     | 
    |  "01-01-21"  |

#Tag-3
  Scenario Outline: Verify valid date [Code 500] 
    * def response = read('../responses/bookingDetails/validBooking.json')
    * def query = {'id': <id>, 'date': <date>}
    Given path '/booking'
    And  params query
    When method get
    Then status 500

    Examples:
        |                    id                     |     date    |        
        |    'popo@gmail.com-0.46884178669816645'   |     '23'    | 