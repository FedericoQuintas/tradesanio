class UsersController < ApplicationController
    def create
        @user = User.new(post_params['email'])
        render plain: {email: @user.email}.to_json, status: 201, content_type: 'application/json'
    end

    private

    def post_params
        params.permit(:email)
    end
end