@ui @sort
Feature: Test cases that cover the sorting operations for BackBase test site.

# These tests fail as sorting isn't working
Scenario Outline: Sort columns descending/ascending
  Given a computer called '<name>' is added via API
  When the user sorts the column '<column>' by '<order>' order
  Then computer '<name>' is visible in the table when not searching

# sorting is broken in the site. 
# The last example only passes because ascending order is on by default.

  Examples:
    | name           | column        | order      |
    | not_first_page | continued     | descending |
    | not_first_page | discontinued  | descending |
    | not_first_page | company       | descending |
    | standard       | computer_name | ascending  |