class WatchlistsController < ApplicationController
    #before_action :require_login
    def create
        if parse_params['description'].blank? || request.headers['X-User-ID'].blank?
            render plain: {}.to_json, status: 400, content_type: 'application/json'
        else
            if Watchlist.where(:description => parse_params["description"], :user_id => request.headers['X-User-ID']).present?
                render plain: {error: "Description repeated"}.to_json, status: 400, content_type: 'application/json' 
            else
                @watchList = Watchlist.create!(description: parse_params["description"], user_id: request.headers['X-User-ID'])
                render plain: {description: @watchList.description}.to_json, status: 201, content_type: 'application/json'
            end
        end
    end

    private

    def parse_params
        params.permit(:description)
    end

    def require_login
        unless logged_in?
            render plain: {error: "Please log in"}.to_json, status: 403, content_type: 'application/json'
        end
      end
end