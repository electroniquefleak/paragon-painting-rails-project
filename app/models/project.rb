class Project < ApplicationRecord
    has_many :roles, :dependent => :destroy
    has_many :users, through: :roles, :dependent => :destroy

    accepts_nested_attributes_for :roles, reject_if: :all_blank
end