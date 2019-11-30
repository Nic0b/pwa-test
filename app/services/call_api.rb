class CallApi

    def initialize 
        super
        @url = "https://ai-for-good-api.herokuapp.com/api/v1/last?device=sensor"

    end


    def get_device
        url = @url + "5"
        response = HTTParty.get(url)    
        body = JSON.parse(response.body)
    end
end