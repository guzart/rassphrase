When /^I generate a passphrase$/ do
  @passphrase = @rassphrase.generate
end

When /^I generate a passphrase with (\d+) words$/ do |word_count|
  @passphrase = @rassphrase.generate(word_count.to_i)
end

Then /^I get a passphrase with concatenated words$/ do
  @passphrase.should == @rassphrase.words.join
end

Then /^all the words are different$/ do
  words = @rassphrase.words
  words.each do |w|
    words.count(w).should be 1
  end
end

Then /^I get a passphrase with (\d+) words$/ do |word_count|
  @rassphrase.should have(word_count.to_i).words
end
