# Created by Matthew B. Reisch at 2/5/2016
Feature: flaskr is secure in that users must log in and out to access certain features

  Scenario: successful login
    Given flaskr is set up
    When we log in with "admin" and "admin"
    Then we should see the alert "You were logged in"

  Scenario: incorrect username
    Given flaskr is set up
    When we log in with "notright" and "admin"
    Then we should see the alert "Invalid username"

  Scenario: incorrect password
    Given flaskr is set up
    When we log in with "admin" and "notright"
    Then we should see the alert "Invalid password"

  Scenario: successful logout
    Given flaskr is set up
    When we logout
    Then we should see the alert "You were logged out"

  Scenario: successful post
    Given flaskr is set up
    And we log in with "admin" and "admin"
    When we add a new entry with "test" and "test" as the title and text
    Then we should see the alert "New entry was successfully posted"
    Then we should see the post with "test" and "test" as the title and text

  Scenario: unsuccessful post
    Given flaskr is set up
    Given we are not logged in
    When we add a new entry with "test" and "test" as the title and text
    Then we should see a "405" status code

  Scenario: view posts logged out
    Given flaskr is set up
    Given we are not logged in
    When we view the index page
    Then we should see the post with "test" and "test" as the title and text
  
  Scenario: view posts logged in
    Given flaskr is set up
    And we log in with "admin" and "admin"
    When we view the index page
    Then we should see the post with "test" and "test" as the title and text

  Scenario: view no posts message logged in
    Given flaskr is set up
    And we log in with "admin" and "admin"
    And there are no posts
    When we view the index page
    Then we should see the alert "No entries yet. Add some!"

  Scenario: view no posts message logged out
    Given flaskr is set up
    Given we are not logged in
    And there are no posts
    When we view the index page
    Then we should see the alert "No entries yet. Add some!"

