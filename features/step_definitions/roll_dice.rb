Given /^that a dice has (\d+) sides$/ do |number_sides|
end

When /^I roll the dice (\d+) times$/ do |times|
  @results = []
  dice = Rassphrase::Dice.new
  times.to_i.times do |n|
    @results << dice.roll
  end
end

Then /^I should get (\d+) numbers between (\d+) and (\d+)$/ do |count, minimum, maximum|
  count.to_i.should == @results.size
  @results.each do |n|
    n.should be >= minimum.to_i
    n.should be <= maximum.to_i
  end
end

Then /^I should get at least (\d+) different numbers$/ do |count|
  different = []
  @results.each { |n| different << n unless different.index(n) }
  different.size.should be >= count.to_i
end
