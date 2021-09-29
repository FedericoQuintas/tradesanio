class UsersController < ApplicationController
    def create
        @user = User.new(params[:user])
        render plain: {}.to_json, status: 201, content_type: 'application/json'
    end
end