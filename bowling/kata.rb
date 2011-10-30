module Bowling
  def Bowling.score_for?(game)
    previous = 0
    rolls = game.split("").collect do |roll|
      result = if roll == "X"
                 10
               elsif roll == "/"
                 10 - previous
               else
                 roll.to_i
               end
      previous = result
      result
    end
    score_for_array(rolls)
  end

  def Bowling.score_for_array(rolls)
    if (rolls.size <= 3)
      rolls.reduce(&:+)
    elsif rolls[0] == 10
      10 + rolls[1] + rolls[2] + score_for_array(rolls.drop(1))
    elsif rolls[0] + rolls[1] == 10
      10 + rolls[2] + score_for_array(rolls.drop(2))
    else
      rolls[0] + rolls[1] + score_for_array(rolls.drop(2))
    end 
  end
end
