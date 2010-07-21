class StatDisplay
  class << self
    def render(results)
      trials       = results.size
      total_wins   = results.map{|r| r[:win] }.compact.inject{|sum, n| sum + n}
      total_losses = results.map{|r| r[:loss] }.compact.inject{|sum, n| sum + n}
      ending       = results.map{|r| r[:bankroll] }.compact.inject{|sum, n| sum + n}
      starting     = results.map{|r| r[:starting_bankroll] }.compact.inject{|sum, n| sum + n}

      winnings = (ending > starting) ? "$#{ending}" : "$(#{ending})"

      puts "Win %: #{total_wins.to_f / trials.to_f}".rjust(20)
      puts "Loss %: #{total_losses.to_f / trials.to_f}".rjust(20)
      puts "$ Won/Lost: #{winnings}".rjust(24)
    end
  end
end