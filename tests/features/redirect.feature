Feature: redirect

  Scenario: 
    Given I am a human
    And I visit https://fastly-bdd-example.com.global.prod.fastly.net/status/200
    Then Response is redirect
    And Response reason is REDIRECT
    And Status code is 302
    And Redirected url is https://fastly-bdd-example.com/gateway

  Scenario: 
    Given I am a googlebot
    And I visit https://fastly-bdd-example.com.global.prod.fastly.net/status/200
    Then Status code is 200
    And Response reason is OK