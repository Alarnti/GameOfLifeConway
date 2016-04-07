require_relative "controller.rb"
require_relative "output_console.rb"
require_relative "board.rb"

require_relative "game_constructor_utils.rb"


# Game construction
output_console = OutputConsole.new

controller = Controller.new 

game = GameConstructorUtils.construct_game_from_file(output_console, controller)

game.start
