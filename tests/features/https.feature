Feature: enforce_ssl

  Scenario: 
    Given I am a human
    And I visit http://fastly-bdd-example.com.global.prod.fastly.net
    Then Response is redirect
    And Response reason is FORCE SSL
    And Status code is 301
    And Redirected url is https://fastly-bdd-example.com/

  Scenario Outline: 
    Given I am a human
    And I visit <url>
    Then Response is redirect
    And Response reason is FORCE SSL
    And Status code is 301
    And Redirected url is <result>

  Examples:
  |url|result|
  |http://fastly-bdd-example.com.global.prod.fastly.net/something|https://fastly-bdd-example.com/something|
  |http://fastly-bdd-example.com.global.prod.fastly.net/somethingelse|https://fastly-bdd-example.com/somethingelse|
