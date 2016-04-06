class Cell

	attr_reader :x,:y
	attr_accessor :life

	def initialize(x,y, life = false)
		@x = x
		@y = y
		@life = life
	end

	def die!
		@life = false
	end

	def alive?
		@life
	end

	def live!
		@life = true
	end

	def toggle!
		@life = !@life
	end
	
end
