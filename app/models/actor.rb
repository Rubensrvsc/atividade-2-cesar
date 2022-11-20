class Actor < ApplicationRecord
    validates :name, :year, :email, presence: true
    validates :email, uniqueness: true

    has_and_belongs_to_many :movies
end
