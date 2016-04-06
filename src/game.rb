require_relative "board.rb"
require_relative "output.rb"
require_relative "controller.rb"

class Game

	attr_reader :board, :output, :controller, :player_name

	#bring interfaces!
	def initialize(board, output, controller)
		@board = board
		@output = output
		@controller = controller
	end


	def start(iterations = 5)
		@player_name = @controller.greetings_and_name
		
		command = @controller.choose_command
	
		begin
			iterations.times do |count|
				game_message = 
				if command == :play
					game_process(count)
				#elsif command == :stop
					#dialog
				elsif command == :exit
					@controller.say_goodbye
				end 

				if game_message == :empty
					@controller.say_goodbye
				elsif game_message == :play
					command = :play
				end
			end
			iterations = @controller.how_much_continue?
			
		end while(true)
	end

	private 
	def game_process(count = nil)
		
		puts "\e[H\e[2J"
		@output.print_out(board,count)
		@board.update_board_generation!
		if @board.empty?
			return :empty
		end
		sleep(1)
	end

=begin
	private 
	def dialog
		command = @controller.choose_command_dialog
		case command
			when :exit then @controller.say_goodbye
			when :play then return :play
		end
	end
=end
end

