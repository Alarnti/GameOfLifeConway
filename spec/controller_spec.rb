require 'stringio'
require_relative "../src/controller.rb"

describe Controller do

	before :all do
		@controller = Controller.new
	end

	describe ".greetings_and_name" do
		
		before do
			$stdin = StringIO.new("Mark")
		end

		after do
			$stdin = STDIN
		end

		it "asks a name and returns it" do
			expect(@controller.greetings_and_name).to eql('Mark')
		end
	end

	describe ".choose_command" do
		
		before :all do
			strio = StringIO.new("play\nexit\nbla-bla")
			$stdin = strio
		end

		after :all do
			$stdin = STDIN
		end

		context "when gets 'play' string" do
			it "returns :play" do
				expect(@controller.choose_command).to eql(:play)
			end
		end

		context "when gets 'exit' string" do
			it "returns :exit" do
				expect(@controller.choose_command).to eql(:exit)
			end
		end

		context "when gets unappropriate command" do
			it "asks a command and returns it as a symbol or prints error" do
				expect(@controller.choose_command).to eql("Your command was not recognized, please, try again")
			end
		end
	end


	describe ".choose_command_dialog" do
		
		before :all do
			strio = StringIO.new("play\nexit\nbla-bla")
			$stdin = strio
		end

		after :all do
			$stdin = STDIN
		end

		context "when gets 'play' string" do
			it "returns :play" do
				expect(@controller.choose_command_dialog).to eql(:play)
			end
		end

		context "when gets 'exit' string" do
			it "returns :exit" do
				expect(@controller.choose_command_dialog).to eql(:exit)
			end
		end

		context "when gets unappropriate command" do
			it "asks a command and returns it as a symbol or prints error" do
				expect(@controller.choose_command_dialog).to eql("Your command was not recognized, please, try again")
			end
		end
		
	end

	describe ".say_goodbye" do
	
		it "exit from the game" do
			expect(@controller.say_goodbye).to raise_error(SystemExit)
		end

	end

	describe ".how_much_continue?" do
		before :all do
			$stdin = StringIO.new("Y\n2\nexit")
		end

		after :all do
			$stdin = STDIN
		end
		
		context "when gets 'Y' and iterations_count" do
			it "returns iterations_count" do
				expect(@controller.how_much_continue?).to eql(2)
			end
		end

		context "when gets N" do
			it "closes the game" do
				expect(@controller.how_much_continue?).to raise_error(SystemExit)
			end
		end
	end

	describe ".get_input_name" do
		before :all do
			$stdin = StringIO.new("file.txt")
		end

		after :all do
			$stdin = STDIN
		end

		it "returns name of the printed file" do
			expect(@controller.get_input_name).to eql("file.txt")
		end
	end

end
