class Movie < ApplicationRecord
    validates :title, :year, presence: true
    validates :title, uniqueness: true
    has_and_belongs_to_many :actors
    has_many :comments

    scope :selecte_movies_attributes, -> { select(:id, :title) }
end
