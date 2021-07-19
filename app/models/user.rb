class User < ApplicationRecord
    has_secure_password
    enum role: [:employee, :admin]

    validates :email, presence: true, uniqueness: true
end
