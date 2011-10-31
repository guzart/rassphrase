Given /^I have a rassphrase$/ do
  @dice = Rassphrase::Dice.new
  @rassphrase = Rassphrase::Rassphrase.new(:dice => @dice)
end

Given /^I have a rassphrase with the Diceware wordlist$/ do
  wordlist_path = File.expand_path("../../../lib/diceware.wordlist", __FILE__)
  @rassphrase = Rassphrase::Rassphrase.new(:wordlist_path => wordlist_path)
end

When /^I ask for a diceware code$/ do
  @dice_rolls_before_code = @dice.roll_count
  @code = @rassphrase.random_code
end

Then /^the dice should roll (\d+) times$/ do |times|
  @dice.roll_count.should == @dice_rolls_before_code + times.to_i
end

Then /^I should get a code with digits from (\d+) to (\d+)$/ do |min, max|
  @code.split('').each do |n|
    n.to_i.should be >= min.to_i
    n.to_i.should be <= max.to_i
  end
end

When /^I ask for the word with the code "([^"]*)"$/ do |code|
  @word = @rassphrase.word(code)
end

Then /^I should get the word "([^"]*)"$/ do |word|
  word.should == @word
end
