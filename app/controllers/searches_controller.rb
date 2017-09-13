class SearchesController < ApplicationController
    def index
        if params[:id]
            get_data(params[:id])
        else
            return
        end
            
    end
    def show
        @params = params[:id]
        get_data(params[:id])
        puts "this is #{@params}"
    end

    def get_data (value)
        @response = HTTParty.get("http://api.pearson.com/v2/dictionaries/entries?headword=#{value}")
        @selectedResponse = @response['results'].select do |result|
            result['headword'] = value
            result['part_of_speech'] != nil
        end
        @results = @selectedResponse.sort_by!{|result| result['part_of_speech']}
    end
end
