class Actor < ApplicationRecord
    validates :name, :year, :email, presence: true

    has_and_belongs_to_many :movies
end
