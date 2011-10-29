Feature: Roll dice
  To ensure randomness, rassphrase will simulate the throw of a dice
  to generate a random code.

  Scenario: Dice numbers range
    Given that a dice has 6 sides
    When I roll the dice 20 times
    Then I should get 20 numbers between 1 and 6

  Scenario: Numbers randomness
    Given that a dice has 6 sides
    When I roll the dice 20 times
    Then I should get at least 4 different numbers