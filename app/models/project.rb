class Project < ApplicationRecord
    has_many :teams, :dependent => :destroy
    has_many :users, through :teams, :dependent => :destroy
end