require_relative "utils.rb"
require_relative "input.rb"

class InputFile < Input
	

	def initialize
	end


	def self.get_input_matrix(path)

		unless File.exist?(path)
			return nil
		end

		width = nil
		height = nil
		coordinates = nil
		File.open(path, "r") do |f|
			height = f.gets.to_i
			width = f.gets.to_i
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
	
		return matrix	 
	end
	
	def self.get_input_cells(matrix)
		include Utils

		if matrix.length == 0 || matrix[0].length == 0
			raise ArgumentError, "Matrix dimensions shouldn't be equal to 0"
		end

		Utils.convert_matrix_to_cells(matrix,matrix.length,matrix[0].length) 
	end

end
