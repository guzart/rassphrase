Feature: Usage Diceware method
  
  To protect my information, as a security aware user 
  I want to generate a secure passphrase using the diceware method

  Scenario: Get a diceware code
    Given I have a rassphrase
    When I ask for a diceware code
    Then the dice should roll 5 times

  Scenario: Diceware code digits
    Given I have a rassphrase
    When I ask for a diceware code
    Then I should get a code with digits from 1 to 6

  Scenario Outline: Usage of diceware word list
    Given I have a rassphrase with the Diceware wordlist
    When I ask for the word with the code "<code>"
    Then I should get the word "<word>"

    Examples:
    | code  | word    |
    | 21111 | cliche  |
    | 16655 | clause  |
    | 15144 | brassy  |
    | 11164 | above   |
    | 36223 | lead    |
    | 52422 | rumen   |