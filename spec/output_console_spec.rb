require_relative "../src/output_console.rb"

describe OutputConsole do

	before :all do
		@output_console = OutputConsole.new	
		@matrix = [[0,1],[1,0]]
	end

	describe ".print_out" do
		it "writes to console image from '.' and '#' of matrix" do
			expect(@output_console.print_out).to output(".#\n#.").to_stdout
		end
	end
end
