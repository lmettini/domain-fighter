class FightController < ApplicationController
	def result
		results = []

		@domains = params[:domain]
		@fighters = []

		@domains.each do |dom|
			result = {}
			result['domain'] = dom
			result['cleanName'] = prepareDomain dom
			result['strength'] = strength result['cleanName']
			@fighters.push result
		end 

		@winner = @fighters.max_by { |x| x['strength'] }
		

	end


	private
		def strength domainName
			Random.rand(100000)

			#begin
			#	response = Unirest.get "https://ajax.googleapis.com/ajax/services/search/web?v=1.0&q=#{domainName}", 
			#		headers:{
			#	    "Accept" => "application/json"
			#	  }

			#	  puts response.body
			#	result = response.body['responseData']['cursor']['resultCount'].delete(',').to_i 

			#	rescue
			#	puts "Something is wrong with #{domainName}"
			#end

			
		end

		def prepareDomain domain
			domain[/(.*).nl$/,1]
		end
end

