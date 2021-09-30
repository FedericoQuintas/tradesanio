class User < ApplicationRecord
    def initialize(email)
        @email = email
    end

    def email
       @email
    end
end
