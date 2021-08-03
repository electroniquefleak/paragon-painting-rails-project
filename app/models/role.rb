class Role < ApplicationRecord
    belongs_to :user
    belongs_to :project

    validates :title, presence: true
    validates_uniqueness_of :user_id, :scope => :project_id

    scope :alphabetical, -> { Role.joins(:user).order(:name)}
end