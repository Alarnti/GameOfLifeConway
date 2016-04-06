require_relative "../src/input_file.rb"


describe InputFile do

	before :all do
		@matrix = new_board = Array.new(10){ Array.new(10,0) }
        [0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0,0,0,0]
      ]

	describe ".get_input" do
		it "returns current cell condition" do
			expect(@cell_true.alive?).to be true
			expect(@cell_false.alive?).to be false
		end
	end

end
