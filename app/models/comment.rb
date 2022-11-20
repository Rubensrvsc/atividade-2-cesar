class Comment < ApplicationRecord
  has_many :logs, dependent: :destroy
  #validations 
  validates :body, presence: true, length: { minimum: 10 }
  validates :approved, inclusion: { in: [true, false] }


  #methods
  def create_log
    self.logs.create(comment_id: self.id, body: self.body, approved: self.approved, created_at: self.created_at, updated_at: self.updated_at)
  end

end
