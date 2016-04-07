require_relative "../src/output_console.rb"
require_relative "../src/controller.rb"
require_relative "../src/game.rb"
require_relative "../src/game_constructor_utils.rb"

describe GameConstructorUtils do

	before :all do 
		@output_console = instance_double("OutputConsole")
		@controller = instance_double("Controller")
	end

	describe "#construct_game_from_file" do

		before :all do
			$stdin = StringIO.new("./spec/test.txt")
		end

		after :all do
			$stdin = STDIN
		end

		it "comstructs game object" do
			expect(GameConstructorUtils.construct_game_from_file(@output_console,@controller)).to be_instance_of(Game) 
		end
	end



end
