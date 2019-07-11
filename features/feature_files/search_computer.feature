@ui @search
Feature: Test cases that cover the search operations for BackBase test site.

  Scenario Outline: Searching computer entries returns correct results
    Given a computer called '<name>' is added via API
    When the user searches for computer '<name>'
    Then computer '<name>' is visible in the table when searching

# Disabled the symbols_name scenario as the computer entry wont get deleted due to bug.

    Examples:
      | name             |
      | long_name        |
      | sql_query_name   |
    # | symbols_name     | Bug search doesn't return results with symbols used in the name
      | numbers_name     |
      | not_first_page   |

  Scenario: Searching computer entry that doesn't exist
    Given the user searches for computer 'standard'
    Then 'Nothing to display' message is displayed
