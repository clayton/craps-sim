class Craps

  attr_accessor :results, :odds, :bet

  def initialize(args)
    @results = []
    @odds    = args[:odds]
    @bet     = args[:bet]
  end

  def play
    10.times do
      game = Game.new({:odds => @odds, :bet => @bet})
      @results << game.start
    end
    StatDisplay.render(@results)
  end

end