module Rassphrase
  # Simulates a dice
  class Dice
    # Creates a new instance of a dice
    def initialize
      @random = Random.new
      @roll_count = 0
    end

    # Returns a random number between 1 and the
    # number of sides in the dice.
    def roll
      @roll_count += 1
      @random.rand(1..6)
    end

    # Indicates the number of times the dice
    # has been rolled.
    def roll_count
      @roll_count
    end
  end
end