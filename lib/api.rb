class API

        #accepts url as string, returns response as JSON object ( Ruby hash )
    def self.fetch(url)
        system "clear"
        puts "Contacting a galaxy far, far away...."
        
        #fetch url  note: no error handling below
        response = RestClient.get(url)

        system "clear"
        #implicit return of parsed JSON response; again, no error handling
        JSON.parse(response)
    end

end
