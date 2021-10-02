class UsersController < ApplicationController
    def create
        if parse_params['email'].blank? || parse_params['pass'].blank?
            render plain: {}.to_json, status: 400, content_type: 'application/json'
        else 
            @user = User.create(email: parse_params['email'], pass: parse_params['pass'])
            render plain: {email: @user.email}.to_json, status: 201, content_type: 'application/json'
        end
    end

    def index
        if parse_params['email'].blank?
            render plain: {}.to_json, status: 400, content_type: 'application/json'
        else 
            @user = User.find_by(email: parse_params['email'])
            render plain: {email: @user.email}.to_json, status: 200, content_type: 'application/json'
        end
    end
    private

    def parse_params
        params.permit(:email, :pass)
    end
end