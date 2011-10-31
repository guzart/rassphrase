Feature: Dice simulation

  In real life a dice is used to generate a random number. To replicate
  this randomness in software, I want to roll a virtual dice.

  Scenario: Dice numbers range
    Given that a dice has 6 sides
    When I roll the dice 20 times
    Then I should get 20 numbers between 1 and 6

  Scenario: Numbers randomness
    Given that a dice has 6 sides
    When I roll the dice 20 times
    Then I should get at least 4 different numbers