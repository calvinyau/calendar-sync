Feature: pull 3rd-party events created on Meetup and display them on the calendar

  As an admin
  So that I can support other 3rd-party organizations with similar interests to my own
  I want to be able to collect their Meetup events and display them on my calendar

  Background: 3rd-party Events have already been created on Meetup and I have been authenticated

    Given I have logged in as an admin on the app
    And I have logged in as an admin on Meetup
    And the following organizations are saved:
      |organization_name|
      |Nature Matters   |
      |Greens Carrots   |

    And the following organizations are not saved:
      |organization_name|
      |Greens Are Us    |
      |Modern Gardeners |

    And the following events exist on Meetup:
      | name             | organization       | description                               | start               | location                   |
      | Nature Stroll    | Nature Matters     | An exciting journey                       | March 19 2015 16:30 | The old Town Hall          |
      | Green Bean Mixer | Green Carrots      | If you like beans you'll like this event! | March 12 2015 00:00 | San Francisco City Library |
      | New Nature       | Greens Are Us      | Greens for everyone                       | March 27 2015 20:30 | Berkeley                   |
      | Gardening        | Modern Gardeners   | Gardening 101                             | March 29 2015 20:30 | Berkeley                   |

    And I am on the calendar page
    And I click on the "pull 3rd-party events" button
    Then I should be on the "import 3rd-party events" page
    And I should see the list "affiliated organizations" containing: "Nature Matters, Green Carrots"
    And I should see the "add new organizations" button
    And I should see the "add organizations by interests" button
    And I should see the following fields: "Accept, Organization Name, Event Name, Description, Start Time, Location"
    And I should see the "Import, Cancel" buttons
    And I should see the list of events containing "Nature Stroll", "Green Bean Mixer"
    And I should see the fields: "Organization Name, Event Name, Description, Start Time, Location" for "Nature Walk", "Green Bean Mixer"
    And I should see "uncheck" the check-box "Accept" for "Nature Stroll", "Green Bean Mixer"



  Scenario: add new organization
    Given I click on the "add new organizations" button
    And I should be on the "add new organization" page
    And I fill in the "Organization Name" field with "Greens Are Us"
    And I click on the "Add" button
    Then I should be on the "import 3rd-party events" page
    And I should see the list "affiliated organizations" containing: "Greens for everyone"

  Scenario: add organizations by interests
    Given I click on the "find organizations by interests" button
    And I should be on the "find organizations" page
    And I fill in the "Interest" field with "Gardening"
    And I click on the "Find" button
    And I should see the organization "Modern Gardeners"
    And I "check" the check-box "Accept" for "Modern Gardeners"
    Then I should be on the "import 3rd-party events" page
    And I should see the list "affiliated organizations" containing: "Modern Gardeners"

  Scenario: accept all events
    Given I "check" the check-box "Accept" for "Nature Walk, Green Bean Mixer"
    And I click on the "Import" button
    Then I should be on the "Events Directory" page
    And I should see the "Nature Stroll", "Green Bean Mixer" links
    # Later redirect to the actual calendar

  Scenario: accept no events
    Given I click on the "Import" button
    Then I should see the warning "No events were accepted. Nothing to import."
    And I click on the "Cancel" button
    And I should be on the "Events Directory" page
    And I should not see the "Nature Stroll", "Green Bean Mixer, New Nature, Gardening" links

  Scenario: cancel operation
    Given I click on the "Cancel" button
    Then I should be on the "Events Directory" page
    And I should not see the "Nature Stroll", "Green Bean Mixer, New Nature, Gardening" links





