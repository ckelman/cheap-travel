module FlightRequester
	require 'json'
	require 'httparty'
	require 'debugger'


# DATES ON FLIGHT LOOKUPS MUST BE IN THE FUTURE (DUH) OR RETURNS A 400 BADREQUEST
	def self.test_request

		key = "AIzaSyCm8x_V0kEsMZlg4Y_SCFwAOYTQ6Wb38LM"
		body = {
		               request: {
		                 passengers: {
		                   adultCount: 1
		                 },
		                 slice: [
		                   {
		                     origin: "BOS",
		                     destination: "LAX",
		                     date: "2015-2-11"
		                   },
		                   {
		                     origin: "LAX",
		                     destination: "BOS",
		                     date: "2015-2-14"
		                   }
		                 ]
		               }
		             }.to_json



		puts body


		response = HTTParty.post 'https://www.googleapis.com/qpxExpress/v1/trips/search?key=AIzaSyCm8x_V0kEsMZlg4Y_SCFwAOYTQ6Wb38LM',
		             :body => body,
		             :headers => { 'Content-Type' => 'application/json' }


		js = response.body.gsub("\n", "")  
		js = JSON.parse(js)


		#each slice is a different 'trip' in ex BOS to LAX is one 'slice'
		trip = js['trips']['tripOption'][0]
			price = trip['pricing'][0]['baseFareTotal']


			duration = trip['slice'][0]['duration']

			legs = Array.new

			trip['slice'][0]['segment'].each do |segment|
				#seems to only be 1 leg per segment
				carrier = segment['flight']['carrier']
				number = segment['flight']['number']
				origin = segment['leg'][0]['origin']
				destination = segment['leg'][0]['destination']
				departureTime = segment['leg'][0]['departureTime']
				segDur = segment['leg'][0]['duration']
				arrivalTime = segment['leg'][0]['arrivalTime']

				legs << Leg.new(segDur, origin, destination, departureTime, arrivalTime, carrier, number)
				
			end

			segment = Segment.new(price, legs, duration)


		debugger
		puts "hi"
	end

end