require 'spec_helper'

module Rassphrase
  describe Dice do

    let(:dice) { Dice.new }

    describe "#roll" do
      it "returns a number between 1 and 6" do
        roll = dice.roll
        roll.should be >= 1
        roll.should be <= 6
      end
    end

    describe "#roll_count" do
      it "returns the number of times the dice has rolled" do
        dice.roll
        dice.roll_count.should == 1
        2.times { dice.roll }
        dice.roll_count.should == 3
        5.times { dice.roll }
        dice.roll_count.should == 8
      end
    end
  end
end