class UsersController < ApplicationController
    def create
        if parse_params['email'].blank? || parse_params['pass'].blank?
            render plain: {}.to_json, status: 400, content_type: 'application/json'
        else 
            if User.where(:email => parse_params['email']).present?
                render plain: {error: "Email already taken"}.to_json, status: 400, content_type: 'application/json'
            else
                @user = User.new(:email => parse_params['email'], :password => parse_params['pass'])
                if @user.save
                    render plain: {email: @user.email}.to_json, status: 201, content_type: 'application/json'
                else
                    render plain: {}.to_json, status: 400, content_type: 'application/json'
                end

            end
        end
    end

    private

    def parse_params
        params.permit(:email, :pass)
    end
end
