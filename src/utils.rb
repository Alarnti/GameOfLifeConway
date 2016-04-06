require_relative "cell.rb"
require_relative "board.rb"
 
module Utils
	def self.convert_matrix_to_cells(matrix, height, width)
		cells = Array.new(height){ Array.new(width) }

		for i in 0...height
			for j in 0...width
					if matrix[i][j] == 1
						cells[i][j] = Cell.new(j,i, true)
					else 
						cells[i][j] = Cell.new(j,i, false)
					end
			end
		end

		Board.new(width,height,cells)
	end

end
