class Segment

	def initialize(cost, legs, duration)
		@cost = cost
		@legs = legs
		@duration = duration
	end

	def get_cost
		@cost
	end

	def get_legs
		@legs
	end

	def get_duration
		@duration
	end

end