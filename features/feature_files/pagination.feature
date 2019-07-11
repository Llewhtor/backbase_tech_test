@ui @pagination
Feature: Test cases that cover the pagination operations for BackBase test site.

  Scenario Outline: Pagination works as expected when no search is conducted
    Given pagination displays results numbers
    When the user clicks '<button>' page
    Then the pagination updates correctly for '<button>' page

    Examples:
      | button   |
      | next     |
      | previous |

# This test fails as pagination doesn't work for filtered results
  Scenario: Pagination works as expected when results are filtered
    Given the user searches for computer 'z'
    And pagination displays results numbers
    When the user clicks 'next' page
    Then the pagination updates correctly for 'next' page
