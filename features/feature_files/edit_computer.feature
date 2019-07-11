@ui @edit
Feature: Test cases that cover the edit operations for BackBase test site.

  Scenario: A computer can be removed
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
    Then computer 'thinking_machines_update' is visible in the table when searching

  Scenario: Cancelling update of computer doesn't save the updates
    Given a computer called 'apple_1' is added via API
    And the user views details for computer 'apple_1'
    When the user updates the 'thinking_machines_update' details and clicks 'cancel'
    Then computer 'apple_1' is visible in the table when searching
