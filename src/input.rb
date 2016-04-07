class Input 

	def initialize 
	end


	def self.get_input_matrix(path)
		raise NotImplementedError, 'You must implement the get_input_matrix method' 
	end

	def self.get_input_cells(matrix)
		raise NotImplementedError, 'You must implement the get_input method' 
	end

end
