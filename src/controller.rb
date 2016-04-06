class Controller

	def initialize
	end


	def greetings_and_name
		puts "Hello, gamer! Can you please tell your name?"
		gets.chomp
	end
		

	def choose_command(name = "")
		puts "#{name}, You can choose one of the options
					1) 'play' with your input file
					2) 'exit' - say goodbye"
		command = gets.chomp

		case command 
			when "play" then :play
			#when "stop" then :stop
			when "exit" then :exit
		else "Your command was not recognized, please, try again"
		end

	end

	def choose_command_dialog()
		answer = nil
		while answer.nil?
			puts "You can choose one of the options
						1) 'play' - continue your game
						2) 'exit' - say goodbye"
			command = gets.chomp

			case command 
				when "play" then answer = :play
				when "exit" then answer = :exit
			else "Your command was not recognized, please, try again"
			end
		end
		
		return answer
	end


	def say_goodbye
		puts "Goodbye #{name unless name.nil?}, live long and prosper!"
		sleep(1.5)
		exit
	end

	def how_much_continue?
		answer = nil
		begin
			puts "Would you like to continue? Please, write correct. Y/N"
			answer = gets.chomp
			answer = nil if answer != "Y" && answer != "N"
		end while answer.nil?

		if answer == "Y"
				iterations = nil
				begin 
					puts "How much iterations more? Please, write correctly, only numbers."
					begin 
						iterations = Integer(gets.chomp)
					rescue
						iterations = nil
					end	 
				end while iterations.nil?
				return iterations
		else 
			say_goodbye
		end

	end

end

