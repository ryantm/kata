require_relative 'kata'

# Goal: make a method that scores a bowling game
# X  - strike
# #  - number score 0 to 9
# #/ - spare
#
# For example:
# X  => 10
# 2/ => 9
# 10 => 1
describe "Bowling" do
  it "should have a method score_for?" do
    Bowling.respond_to? :score_for?
  end
  it "a partial frame should score correctly" do
    Bowling.score_for?("0").should == 0
    Bowling.score_for?("1").should == 1
    Bowling.score_for?("X").should == 10
  end

  it "should score a complete frame correctly" do
    Bowling.score_for?("00").should == 0
    Bowling.score_for?("10").should == 1
    Bowling.score_for?("12").should == 3
    Bowling.score_for?("2/").should == 10    
  end

  it "should score two frames correctly" do
    Bowling.score_for?("0000").should == 0
    Bowling.score_for?("0001").should == 1
    Bowling.score_for?("2001").should == 3
    Bowling.score_for?("000/").should == 10
    Bowling.score_for?("00X").should == 10
    Bowling.score_for?("X01").should == 11 
  end

  it "should handle strikes correctly" do
    Bowling.score_for?("XXX").should == 30
    Bowling.score_for?("X0/00").should == 30
    Bowling.score_for?("X0/11").should == 33
  end

  it "should handle spares correctly" do
    Bowling.score_for?("0/").should == 10
    Bowling.score_for?("0/10").should == 12
    Bowling.score_for?("0/2/").should == 22
    Bowling.score_for?("0/0/").should == 20
    Bowling.score_for?("8/8").should == 18
  end

  it "should handle a complete game correctly" do
    Bowling.score_for?("X"*12).should == 300
    Bowling.score_for?("90356136815325807181").should == 82
    Bowling.score_for?("903/613/815/0/807/8/8").should == 131
    Bowling.score_for?("X7/729/XXX236/7/3").should == 168
  end

end
