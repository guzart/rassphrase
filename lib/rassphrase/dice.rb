module Rassphrase
  class Dice
    def initialize
      @random = Random.new
      @roll_count = 0
    end

    def roll
      @roll_count += 1
      @random.rand(1..6)
    end

    def roll_count
      @roll_count
    end
  end
end