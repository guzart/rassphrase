module Rassphrase
  class Dice
    
    def initialize
      @random = Random.new
    end

    def roll
      @random.rand(1..6)
    end
  end
end