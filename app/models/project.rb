class Project < ApplicationRecord
    has_many :roles, :dependent => :destroy
    has_many :users, through: :roles, :dependent => :destroy
end