require 'Logger'

LOGGER = Logger.new(STDOUT)
LOGGER.level = Logger::WARN

require 'lib/dealer.rb'
require 'lib/shooter.rb'
require 'lib/dice.rb'
require 'lib/game.rb'
require 'lib/stat.rb'
require 'lib/stat_display.rb'
require 'lib/craps.rb'

# require 'rubygems'
# require 'ruby-debug'

c = Craps.new({:bet => 10, :odds => {6 => 3, 8 => 3, 5 => 4, 9 => 4, 4 => 5, 10 => 5}})
c.play