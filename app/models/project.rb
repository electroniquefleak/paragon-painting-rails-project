class Project < ApplicationRecord
    has_many :roles, :dependent => :destroy
    has_many :users, through: :roles, :dependent => :destroy

    accepts_nested_attributes_for :roles, reject_if: :all_blank

    validates :name, presence: true, uniqueness: true
    validates :location, presence: true, uniqueness: true

    scope :active, -> { where("? BETWEEN start_date AND end_date", Date.today)} 
    scope :past, -> { where('end_date < ?', Date.today)} 
    scope :future, -> { where('start_date > ?', Date.today)}
end