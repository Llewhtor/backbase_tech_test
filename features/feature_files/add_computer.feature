@ui @add_computer
Feature: Test cases that cover the add computer operations for BackBase test site.

  Scenario: A new computer can be added
    Given the user adds a new computer called 'standard' via UI
    When success message is displayed for 'standard' computer
    Then the computers found is updated by 1
    And computer 'standard' is visible in the table when searching

  Scenario: Adding computer with duplicate name creates multiple entries with the same names
    Given a computer called 'apple_1' is added via API
    When a computer called 'apple_1' is added via API
    Then computer 'apple_1' is listed 2 times in the table

  Scenario Outline: Adding computer with invalid field entries generates correct error
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
    Then computer '<name>' is visible in the table when searching

    # Test for symbols_name fails due to bug where search doesn't return for symbols

    Examples:
      | name            |
      | long_name       |
      | sql_query_name  |
    # | symbols_name    | Disabled otherwise computer will stay in list
      | numbers_name    |
      | backwards_dates |

  Scenario Outline: Computers can be created with all companies
    Given the user adds a new computer called '<name>' via UI
    When success message is displayed for '<name>' computer
    Then computer '<name>' is visible in the table when searching

    # Expectations may fail here if other people are using the site.
    # I thought about regex'ing the number of computers found,
    # But thought in a test environment this would be fine.

    Examples:
      | name                                             |
      | apple_inc_test                                   |
      | thinking_machines_test                           |
      | rca                                              |
      | netronics_test                                   |
      | tandy_corporation_test                           |
      | commodore_international_test                     |
      | mos_technology_test                              |
      | micro_instrumentation_and_telemetry_systems_test |
      | ims_associates_inc_test                          |
      | digital_equipment_corporation_test               |
      | lincoln_laboratory_test                          |
      | moore_school_of_electrical_engineering_test      |
      | ibm_test                                         |
      | amiga_corporation_test                           |
      | canon_test                                       |
      | nokia_test                                       |
      | sony_test                                        |
      | oqo_test                                         |
      | next_test                                        |
      | atari_test                                       |
      | acorn_computer_test                              |
      | timex_sinclair_test                              |
      | nintendo_test                                    |
      | sinclair_research_ltd_test                       |
      | xerox_test                                       |
      | hewlett-packard_test                             |
      | zemmix_test                                      |
      | acvs_test                                        |
      | sanyo_test                                       |
      | cray_test                                        |
      | evans_&_sutherland_test                          |
      | esr_inc_test                                     |
      | omron_test                                       |
      | bbn_technologies_test                            |
      | lenovo_group_test                                |
      | asus_test                                        |
      | amstrad_test                                     |
      | sun_microsystems_test                            |
      | texas_instruments_test                           |
      | htc_corporation_test                             |
      | research_in_motion_test                          |
      | samsung_electronics_test                         |
