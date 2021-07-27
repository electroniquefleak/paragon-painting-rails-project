class User < ApplicationRecord
    has_secure_password
    enum role: [:employee, :admin]
    has_many :roles, :dependent => :destroy
    has_many :projects, through: :roles, :dependent => :destroy

    validates :email, presence: true, uniqueness: true
end
