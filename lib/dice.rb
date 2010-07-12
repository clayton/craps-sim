class Dice
  def initialize
    @dice = [[1,2,3,4,5,6],[1,2,3,4,5,6]]
  end

  def roll
    die_one = @dice[0]
    die_two = @dice[1]

    die_one[rand(5) + 1] + die_two[rand(5) + 1]
  end
end