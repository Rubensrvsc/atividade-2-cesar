class Movie < ApplicationRecord
    validates :title, :year, presence: true
    validates :title, uniqueness: true
    validate :validate_year, :actors_required
    has_and_belongs_to_many :actors
    has_many :comments

    scope :selecte_movies_attributes, -> { select(:id, :title) }

    private

    def validate_year
        if self.year.to_i < 0
            self.errors.add(:year, "Should be more than zero")
        end
    end

    def actors_required
        if self.actors.size == 0
            self.errors.add(:actor, "Include at least actor")
        end
    end
end
