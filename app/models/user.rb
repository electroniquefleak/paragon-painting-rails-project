class User < ApplicationRecord
    has_secure_password
    enum role: [:employee, :admin]
    has_many :teams, :dependent => :destroy
    has_many :projects, through: :teams, :dependent => :destroy

    validates :email, presence: true, uniqueness: true
end
