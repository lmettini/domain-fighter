

class HomeController < ApplicationController
  def index

		response = Unirest.get "http://www.undeveloped.nl/api/v1/events.json?filter=alles", 
			headers:{
		    "Accept" => "application/json"
		  }
		  
		@domains = response.body

		@columns = []
		@columns.push @domains[0..15]
		@columns.push @domains[16..31]
		@columns.push @domains[32..47]

  end
end


