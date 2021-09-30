class UsersController < ApplicationController
    def create
        if post_params['email'].blank?
            render plain: {}.to_json, status: 400, content_type: 'application/json'
        else 
            @user = User.new(post_params['email'])
            render plain: {email: @user.email}.to_json, status: 201, content_type: 'application/json'
        end
    end

    private

    def post_params
        params.permit(:email)
    end
end