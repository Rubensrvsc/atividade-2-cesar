class Comment < ApplicationRecord
  has_many :logs, dependent: :destroy
  #validations 
  validates :body, presence: true, length: { minimum: 10 }
  validates :approved, inclusion: { in: [true, false] }
  belongs_to :movie

  scope :comments_approveds, -> (id) { where(movie_id: id, approved: true) }


  #methods
  def create_log
    self.logs.create(comment_id: self.id, date_approved: Time.now)
  end

end
