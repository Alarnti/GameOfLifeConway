require_relative "game.rb"
require_relative "input_file.rb"
require_relative "controller.rb"
require_relative "output_console.rb"
require_relative "board.rb"

output_console = OutputConsole.new

controller = Controller.new 

game = Game.new(InputFile.get_input("input.txt"), output_console, controller)

game.start
