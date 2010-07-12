class Craps

  attr_accessor :results, :odds, :bet

  def initialize(args)
    @results = []
    @odds    = args[:odds]
    @bet     = args[:bet]
  end

  def play
    100.times do
      game = Game.new({:odds => @odds, :bet => @bet})
      @results << game.start
    end
    Result.display(results)
  end

end