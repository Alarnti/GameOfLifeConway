require_relative "../src/board.rb"
require_relative "../src/input_file.rb"


describe Board do
	
	before :all do
		@matrix_generation = InputFile.get_input_matrix('./spec/board_test.txt')
		cells = InputFile.get_input_cells(@matrix_generation)
		@board_generation = Board.create(cells)

		@matrix_empty = [[0,0],[0,0]]
		cells_empty =  InputFile.get_input_cells(@matrix_empty)
		@board_empty = Board.create(cells_empty)
	end

	describe ".update_board_generation!" do
		#universal test for extreme cases and rules of the game
=begin
		##......##
		##......##
		..........
		..........
		...###....
		..........
		..........
		..........
		##......##
		##......##
		
		Blinker coordinates
		5 5
		5 6
		5 4

after one generation should be:

		##......##
		##......##
		..........
		....#.....
		....#.....
		....#.....
		..........
		..........
		##......##
		##......##
=end
		it "does a generation update" do
			@board_generation.update_board_generation!

			@matrix_generation[5][4] = 0
			@matrix_generation[5][6] = 0
			@matrix_generation[4][5] = 1
			@matrix_generation[6][5] = 1

			for i in 0...10
				for j in 0...10
					expect((@board_generation.cells[i][j].alive? && @matrix_generation[i][j] == 1) || (!@board_generation.cells[i][j].alive? && @matrix_generation[i][j] == 0)).to be true
				end
			end			
		end
	end

	describe ".empty?" do
		
		context "when board is empty" do
			it "returns true" do
				expect(@board_empty.empty?).to be true
			end
		end
	
		context "when board is not empty" do
			it "returns false" do
				expect(@board_generation.empty?).to be false
			end
		end
	end

end
