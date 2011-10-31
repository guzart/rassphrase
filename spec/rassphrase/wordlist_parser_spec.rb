require 'spec_helper'

module Rassphrase
  describe WordlistParser do
    describe '::parse_line' do
      it 'returns a hash with a code and a word' do
        WordlistParser.parse_line('21324 geek').should == {:code => '21324', :word => 'geek'}
      end
    end

    describe '::parse' do
      it "returns a wordlist from a filepath" do
        wordlist = WordlistParser.parse(File.expand_path("../../../lib/diceware.wordlist", __FILE__))
        wordlist["16655"].should == "clause"
      end
    end
  end
end