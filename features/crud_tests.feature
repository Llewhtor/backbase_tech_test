@crud
Feature: Test cases that cover the CRUD operations for BackBase test site.

  Test cases that cover the CRUD operations.

  Scenario: A new computer can be added to the database
    Given the user adds a new computer called 'standard' via UI
    When success message is displayed for 'standard' computer
    Then the computers found is updated by 1
    And the computer 'standard' is correctly visible in the table

  Scenario: A computer can be removed from the database
    Given a computer called 'apple_1' is added via API
    When the user deletes the computer 'apple_1'
    Then the computer 'apple_1' is no longer visible in the table

  Scenario: Computer information can be viewed
    Given a computer called 'apple_1' is added via API
    When the user views details for computer 'apple_1'
    Then the information for computer 'apple_1' is present

  Scenario: Computer information can be updated
    Given a computer called 'apple_1' is added via API
    And the user views details for computer 'apple_1'
    When the user updates the 'thinking_machines_update' details and clicks 'save'
    Then the computer 'thinking_machines_update' is correctly visible in the table

  Scenario: Cancelling update of computer doesn't save the updates
    Given a computer called 'apple_1' is added via API
    And the user views details for computer 'apple_1'
    When the user updates the 'thinking_machines_update' details and clicks 'cancel'
    Then the computer 'apple_1' is correctly visible in the table

  Scenario: Adding computer with duplicate name creates multiple entries with the same names
    Given a computer called 'apple_1' is added via API
    When a computer called 'apple_1' is added via API
    Then computer 'apple_1' is listed 2 times in the table

  Scenario Outline: Adding computer with no name generates correct error
    Given the user adds a new computer called '<name>' via UI
    Then the bad input generates an error

    Examples:
      | name                  |
      | no_name               |
      | bad_continued_date    |
      | bad_discontinued_date |

  Scenario Outline: Creating computer entries with non-standard name entries
    Given the user adds a new computer called '<name>' via UI
    When success message is displayed for '<name>' computer
    Then the computer '<name>' is correctly visible in the table

    Examples:
      | name             |
      | long_name        |
      | sql_query_name_1 |
      # | symbols_name     | removed as bug where unable to search with $
      | numbers_name     |

  Scenario Outline: Searching computer entries returns correct results
    Given a computer called '<name>' is added via API
    When the user searches for computer '<name>'
    Then the computer '<name>' is correctly visible in the table

    Examples:
      | name             |
      | long_name        |
      | sql_query_name_1 |
      | sql_query_name_2 |
      # | symbols_name     | - Bug search doesn't return results with $$ in the name
      | numbers_name     |
      | not_first_page   |

  Scenario: Searching computer entry that doesn't exist
    Given the user searches for computer 'standard'
    Then 'Nothing to display' message is displayed

  Scenario Outline: Pagination works as expected when no search is conducted
    Given pagination displays results numbers
    When the user clicks '<button>' page
    Then the pagination updates correctly for '<button>' page

    Examples:
      | button   |
      | next     |
      | previous |

# This test fails as pagination doesn't work for filtered results
  # Scenario: Pagination works as expected when results are filtered
  #   Given the user searches for computer 'z'
  #   And pagination displays results numbers
  #   When the user clicks 'next' page
  #   Then the pagination updates correctly for 'next' page

# These tests fail as sorting isn't working
# Scenario Outline: Sort columns descending/ascending
#   Given a computer called '<name>' is added via API
#   When the user sorts the column '<column>' by '<order>' order
#   Then the computer '<name>' is correctly visible in the table

#   Examples:
#     | name           | column        | order      |
#     | not_first_page | continued     | descending |
#     | not_first_page | discontinued  | descending |
#     | not_first_page | company       | descending |
#     | standard       | computer_name | ascending  |
