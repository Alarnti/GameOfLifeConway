require_relative "../src/utils.rb"
require_relative "../src/cell.rb"

describe Utils do

	before :all do
		@matrix = [[0,1],[1,0]]
  end

	describe "#convert_matrix_to_cells" do
		it "converts matrix to cell-matrix" do
			Utils.convert_matrix_to_cells(@matrix,2,2).each do |cell|
				expect(cell).to be_instance_of(Cell) 
			end
		end
	end

end
