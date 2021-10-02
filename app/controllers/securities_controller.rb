class SecuritiesController < ApplicationController
    def create
        if parse_params['ticker'].blank?
            render plain: {}.to_json, status: 400, content_type: 'application/json'
        else 
            Security.create(ticker: parse_params['ticker'])
            render plain: {}.to_json, status: 201, content_type: 'application/json'
        end
    end

    private

    def parse_params
        params.permit(:ticker)
    end
end