class Leg

	def initialize(duration, origin, destination, departureTime, arrivalTime, carrier, flightNumber)
		@duration = duration
		@orign = origin
		@destination = destination
		@departureTime = departureTime
		@arrivalTime = arrivalTime
		@carrier = carrier
		@flightNumber = flightNumber
	end

	def get_duration
		@duration
	end

	def get_origin
		@origin
	end

	def get_destination
		@destination
	end

	def get_departureTime
		@departureTime
	end

	def get_arrivalTime
		@arrivalTime
	end

	def get_carrier
		@carrier
	end

	def get_flightNumber
		@flightNumber
	end

end