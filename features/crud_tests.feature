Feature: Test cases that cover the CRUD operations for BackBase test site.

  Test cases that cover the CRUD operations plus any identified edge cases.
@edd
  Scenario: A new computer can be added to the database
    Given the user adds a computer called 'standard' via UI
    When the user navigates to the main page
    Then the computers found is updated by 1
    And the computer '<name>' is correctly visible in the table

  Scenario: A computer can be removed from the database
    Given the user adds a computer called '<name>'
    When the user deletes the computer '<name>'
    Then the computer '<name>' is no longer visible in the table

  Scenario: Computer information can be viewed
    Given the user adds a computer called '<name>'
    When the user views details for computer '<name>'
    Then the information for computer '<name>' is present

  Scenario: Computer information can be updated
    Given the user adds a computer called '<name>'
    And the user views details for computer '<name>'
    When the user updates the '<name>' details and clicks '<button>'
    Then the computer '<name>' is correctly visible in the table

  Scenario: Cancelling update of computer doesn't save the updates
    Given the user adds a computer called '<name>'
    When the user updates the '<name>' details and clicks '<button>'
    Then the information for computer '<name>' is present

  Scenario: Adding computer with duplicate name creates multiple entries with the same names
    Given the user adds a computer called '<name>'
    When the user adds a computer called '<name>'
    Then computer '<name>' is listed '<count>' times in the table

  Scenario Outline: Creating computer entries with non-standard entries
    Given the user adds a computer called '<name>'
    When the user navigates to the main page
    Then the information for computer '<name>' is present

    Examples:
      | name |
      |      |
      |      |

  Scenario Outline: Searching computer entries returns correct results
    Given the user adds a computer called '<name>'
    When the user searches for computer '<name>'
    Then the information for computer '<name>' is present

    Examples:
      | name |
      |      |
      |      |

  Scenario Outline: Sort columns descending/ascending
    Given the user adds a computer called '<name>'
    When the user sorts the column '<column>' by '<order>' order
    Then the information for computer '<name>' is present

    Examples:
      | name | order |
      |      |       |
      |      |       |