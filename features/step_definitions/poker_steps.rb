Transform /^hand with cards "([123456789TJQKA CDSH]*)"$/ do |cards|
  Hand.new(cards)
end

Given /^a (black|white) (hand with cards "[^\"]*")$/ do |player, hand|
  instance_variable_set("@#{player}", hand)
end

Then /^black wins against white$/ do
  @black.should >  @white
end

Then /^black ties against white$/ do
  @black.should == @white
end

Then /^black loses against white$/ do
  @black.should <  @white
end
