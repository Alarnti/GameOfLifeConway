require_relative "utils.rb"
require_relative "input.rb"

class InputFile < Input
	

	def initialize
	end


	def self.get_input(path)
		include Utils
		width = nil
		height = nil
		coordinates = nil
		File.open(path, "r") do |f|
			width = f.gets.to_i
			height = f.gets.to_i
			coordinates = []
  		while line = f.gets
				unless line == "\n"
    			coordinates << line.split(" ").map(&:to_i)
				end
			end
		end

		matrix = Array.new(height){ Array.new(width,0) }

		coordinates.each do |el|
			matrix[el[0]][el[1]] = 1
		end
	
		Utils.convert_matrix_to_cells(matrix,height,width)  
	end

end
