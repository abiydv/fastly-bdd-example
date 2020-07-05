Feature: block_bots_and_humans

  Scenario: bot-block-path1
    Given I am a bingbot
    And I visit https://fastly-bdd-example.com.global.prod.fastly.net/block-path1
    Then Status code is 403
    And Response reason is BLOCKED

  Scenario Outline: <path>
    Given I am a human
    And I visit https://fastly-bdd-example.com.global.prod.fastly.net<path>
    Then Status code is 403
    And Response reason is BLOCKED

  Examples:
  |path|
  |/block-path1|
  |/block-path2|
