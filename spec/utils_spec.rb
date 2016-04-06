require_relative "../src/utils.rb"


describe Board do
	
	before :all do
		@board = Board.
	end

	describe "#alive?" do
		it "returns current cell condition" do
			expect(@cell_true.alive?).to be true
			expect(@cell_false.alive?).to be false
		end
	end

end
