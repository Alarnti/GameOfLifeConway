require_relative "output.rb"

class OutputConsole < Output

	def initialize
	end

	def print_out(board, generation = nil)
		puts "generation #{generation}"
  	board.cells.each do |row| 
			row.each do |val| 
				print "#{val.alive? ? '#' : '.'} "
			end
			puts
		end
	end
end
		
