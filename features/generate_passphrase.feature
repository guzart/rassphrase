Feature: Generates a passphrase

  To protect my information, as a security aware user 
  I want to generate a random passphrase

  Scenario: Random passphrase
    Given I have a rassphrase
    When I generate a passphrase
    Then I get a passphrase with concatenated words

  Scenario: Different words
    Given I have a rassphrase
    When I generate a passphrase
    Then all the words are different

  Scenario: Specific word size
    Given I have a rassphrase
    When I generate a passphrase with 9 words
    Then I get a passphrase with 9 words