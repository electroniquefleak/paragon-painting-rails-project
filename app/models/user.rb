class User < ApplicationRecord
    has_secure_password
    enum role: [:employee, :admin]
end
