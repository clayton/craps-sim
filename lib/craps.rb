class Craps

  attr_accessor :results

  def initialize(args)
    @results = []
    @game    = Game.new({:odds => args[:odds], :bet => args[:bet]})
  end

  def play
    results << @game.start
    Result.display(results)
  end

end