class StatDisplay
  class << self
    def render(results)
      File.open("results.csv", "w") do |f|
        f.write "Wins,Losses,Started With, Ended With\r\n"
        results.map do |result|
          f.write "#{result[:win]}, #{result[:loss]}, #{result[:starting_bankroll]}, #{result[:bankroll]}\r\n"
        end

      end
    end
  end
end