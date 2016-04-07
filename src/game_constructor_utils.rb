require_relative "board.rb"
require_relative "game.rb"
require_relative "utils.rb"
require_relative "input_file.rb"

class GameConstructorUtils
	include Utils

	def initialize
	end
	
	
	def self.construct_game_from_file(output_console, controller)

		output_console = OutputConsole.new

		controller = Controller.new 
		
		begin
		  file_name = controller.get_input_name
		end until Utils.file_exist?(file_name)

		matrix = InputFile.get_input_matrix(file_name)
		cells = InputFile.get_input_cells(matrix)

# cells - correct object, because we get it from get_input_cells method
		board = Board.create(cells)

		game = Game.new(board, output_console, controller)

		return game
	end




end
