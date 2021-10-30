class SessionsController < ApplicationController
    def login
        user = User.authenticate(parse_params['email'], parse_params['password'])
        if user
            head :ok, content_type: 'application/json', token: Token.create!(user).token
        else
            render plain: {error: "Unauthorized"}.to_json, status: 403, content_type: 'application/json' 
        end
    end

    def parse_params
        params.permit(:email, :password)
    end
end