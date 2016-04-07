require_relative "../src/input_file.rb"


describe InputFile do

	before :all do
		@correct_matrix = [[0,0,0],[1,1,1],[0,0,0]]
		@incorrect_matrix_first = [[],[],[]]
		@incorrect_matrix_second = []
  end

	describe "#get_input_matrix" do
		
		context "when file is not found" do
			it "returns nil" do
				expect(InputFile.get_input_matrix('not_exist')).to eql(nil)
			end
		end

		context "when file is found" do
			it "returns correct matrix" do
				expect(InputFile.get_input_matrix('./spec/test.txt')).to eql(@correct_matrix) 
			end
		end

	end


	describe "#get_input_sells" do
		
		context "when matrix is not correct" do
			it "raises an Error" do
				expect{InputFile.get_input_cells(@incorrect_matrix_first)}.to raise_error(ArgumentError, "Matrix dimensions shouldn't be equal to 0")
				expect{InputFile.get_input_cells(@incorrect_matrix_first)}.to raise_error(ArgumentError, "Matrix dimensions shouldn't be equal to 0")
			end
		end

	end

end
