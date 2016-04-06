require_relative "../src/cell.rb"

describe Cell do
	
	before :all do
		@cell_true = Cell.new(1,2,true)
		@cell_false = Cell.new(4,3,false)
	end

	describe "#alive?" do
		it "returns current cell condition" do
			expect(@cell_true.alive?).to be true
			expect(@cell_false.alive?).to be false
		end
	end

end
