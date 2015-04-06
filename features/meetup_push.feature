Feature: as an admin, create events on the website and push to meetup

    As an admin of the website
    So I don't have to create events redundantly
    I want to have events I create on the website automatically push to Meetup

  Background: create an event on local calendar
    Given I am on the "Create" page
    And I have logged in as an admin on Meetu
    And I fill in the "Event Name" field with "Nature Walk"
    And I fill in the "Description" field with "Join us for a nature walk through old town San Franciso!"
    And I select "3/19/2015, 4:30pm" as the date and time
    And I fill in the "Location" field with "The Old Town Hall"
    And I fill in the "Organization" field with "trololol"
    And I click on the "Create Event" button
    Then I should be on the "Events Directory" page


Scenario: successfully push newly created event to Meetup
    Then I should see the message "Event successfully pushed to Meetup"
    And the "Calendar" event "Nature Walk" should exist
    And the "Meetup" event "Nature Walk" should exist

Scenario: failed push of newly created event to Meetup (Implemented as a transaction)
    Then I should see the message "Failed to push event to Meetup. Creation aborted."
    And the "Calendar" event "Nature Walk" should not exist
    And the "Meetup" event "Nature Walk" should not exist