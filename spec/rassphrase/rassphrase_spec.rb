require 'spec_helper'

module Rassphrase
  describe Rassphrase do
    let(:wordlist) { {12345 => "helloworld"} }
    let(:rassphrase) { Rassphrase.new }
    let(:beale_path) { File.expand_path("../../../lib/beale.wordlist", __FILE__) }

    describe "#initialize" do
      it "deaults to use the diceware wordlist" do
        rassphrase.word("12345").should == "apathy"
      end

      it "defaults to 5 words" do
        rassphrase.should have(5).words
      end

      it "generates a passphrase" do
        rassphrase.passphrase.should have_at_least(4).characters
      end

      context "accepts a hash argument with the option" do
        it ":dice to specify the dice" do
          dice = Dice.new
          Rassphrase.new(:dice => dice).generate_code
          dice.roll_count.should > 0
        end

        it ":size to specify the size of the passphrase" do
          Rassphrase.new(:size => 10).should have(10).words
        end

        it ":wordlist to specify the wordlist to use" do
          Rassphrase.new(:wordlist => wordlist).word("12345").should == "helloworld"
        end

        it ":wordlist_path to specify the path to the wordlist file" do
          Rassphrase.new(:wordlist_path => beale_path).word("12345").should == "april"
        end

        it ":capitalize to return a passphrase with capitalized words" do
          rassphrase = Rassphrase.new(:capitalize => true)
          rassphrase.passphrase.should == rassphrase.words.map{ |w| w.capitalize }.join
        end
      end
    end

    describe "#codes" do
      it "returns the codes used in the passphrase" do
        codes = rassphrase.codes
        codes.each_index do |index|
          rassphrase.words[index].should == rassphrase.word(codes[index])
        end
      end
    end

    describe "#generate" do
      it "returns a passphrase" do
        passphrase = rassphrase.generate
        passphrase.should have_at_least(1).character
        passphrase.should be_an_instance_of(String)
      end

      it "generates a new passphrase" do
        rassphrase.passphrase.should_not == rassphrase.generate
      end

      it "accepts the number of words for the passphrase" do
        rassphrase.should have(5).words
        rassphrase.generate(8)
        rassphrase.should have(8).words
      end
    end

    describe "#generate_code" do
      it "returns five characters" do
        rassphrase.generate_code.size.should be 5
      end

      it "returns only numeric characters" do
        rassphrase.generate_code.should match /\d{5}/
      end

      it "returns numeric characters between 1 and 6" do
        code = rassphrase.generate_code.split('')
        code.each do |c|
          c.to_i.should be <= 6
          c.to_i.should be >= 1
        end
      end
    end

    describe "#length" do
      it "returns the number of words in the passphrase" do
        rassphrase.should have(5).words
        rassphrase.generate(9)
        rassphrase.should have(9).words
      end
    end

    describe "#random_item" do
      it "returns a random code and word pair from the word list" do
        item = rassphrase.random_item
        rassphrase.word(item[:code]).should == item[:word]
      end

      it "keeps generating codes until a word is found" do
        pending 'have to use a mock on self'
      end
    end

    describe "#word" do
      before(:each) { rassphrase.wordlist = wordlist }
      
      it "returns the word for a code" do
        rassphrase.word("12345").should == "helloworld"
      end

      it "accepts strings as the code argument" do
        rassphrase.word("12345").should == "helloworld"
      end

      it "accepts numbers as the code argument" do
        rassphrase.word(12345).should == "helloworld"
      end
    end

    describe "#words" do
      it "returns the words used in the passphrase" do
        rassphrase.passphrase.should == rassphrase.words.join
      end
    end

    describe "#wordlist=" do
      it "changes the hash argument keys to strings" do
        rassphrase.wordlist = {12345 => "foobar"}
        rassphrase.word("12345").should == "foobar"
      end

      it "replaces the used wordlist" do
        rassphrase.wordlist = {"123321" => "ab"}
        rassphrase.word("123321").should == "ab"
        rassphrase.wordlist = {"456654" => "ca"}
        rassphrase.word("123321").should be_nil
      end

      it "accepts a filepath" do
        rassphrase.wordlist = beale_path
        rassphrase.word("12345").should == "april"
      end
    end

  end
end