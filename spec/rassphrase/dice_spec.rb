require 'spec_helper'

module Rassphrase
  describe Dice do
    describe "#roll" do
      it "returns a number between 1 and 6" do
        dice = Dice.new
        roll = dice.roll
        roll.should be >= 1
        roll.should be <= 6
      end
    end
  end
end