require_relative "cell.rb"

class Board

  attr_reader :width, :height, :cells

	def initialize(height,width, cells)
		@width = width
		@height = height
		@cells = cells
	
	end
	
	def self.create(cells)
		Board.new(cells.length, cells[0].length, cells)
	end

	def empty?
		@cells.each do |row|
			row.each do |el|
				if el.alive? 
					return false 
				end
			end
		end

		true

	end


	def update_board_generation!
		new_board = Array.new(height){ Array.new(width,0) }

		for i in 0...height
			for j in 0...width
				neighbours_count = 0
				
				neighbours_count = neighbours_count + 1 if i-1 >= 0 && j-1 >= 0 && @cells[i - 1][j - 1].alive?
				neighbours_count = neighbours_count + 1 if i-1 >= 0 && @cells[i - 1][j].alive?
				neighbours_count = neighbours_count + 1 if i-1 >= 0 && j+1 < width  && @cells[i - 1][j +1].alive?

				neighbours_count = neighbours_count + 1 if j-1 >= 0 && @cells[i][j - 1].alive?
				neighbours_count = neighbours_count + 1 if j+1 < width && @cells[i][j + 1].alive?


				neighbours_count = neighbours_count + 1 if i+1 < height && j-1 >= 0 && @cells[i + 1][j - 1].alive?
				neighbours_count = neighbours_count + 1 if i+1 < height && @cells[i + 1][j].alive?
				neighbours_count = neighbours_count + 1 if i+1 < height && j+1 < width && @cells[i + 1][j +1].alive?

				if cells[i][j].alive?
					if neighbours_count == 3 || neighbours_count == 2
						new_board[i][j] = cells[i][j]
					else 
						new_board[i][j] = Cell.new(cells[i][j].x,cells[i][j].y, false)
					end

				else

					if neighbours_count == 3
						new_board[i][j] = Cell.new(cells[i][j].x,cells[i][j].y, true)
					else 
						new_board[i][j] = cells[i][j]
					end

				end

			end
		end

		@cells = new_board

	end


end
