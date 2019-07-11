@api
Feature: Test cases that cover the api requests for BackBase test site.

  Scenario Outline: Correct response recieved when posting invalid request to add computer API endpoint
    Given invalid post request '<name>' is made to the add endpoint
    Then a '<response>' response code is recieved

    Examples:
      | name                          | response |
      | api_invalid_name              | 400      |
      | api_invalid_intro_date        | 400      |
      | api_invalid_discontinued_date | 400      |
      | api_invalid_company           | 400      |

  Scenario: Correct response recieved when posting invalid request to delete computer API endpoint
    Given invalid post request is made to the delete endpoint
    Then a '400' response code is recieved